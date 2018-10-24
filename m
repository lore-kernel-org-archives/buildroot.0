From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 17:54:31 +0200
Subject: [Buildroot] [PATCH v3] qt5base: Qt KMS support does not depend
 on opengl
In-Reply-To: <2357aab6-f2e6-54d4-0e37-63955864e94e@mind.be> (Arnout
 Vandecappelle's message of "Mon, 22 Oct 2018 00:18:24 +0100")
References: <1518540366-13393-1-git-send-email-joshua.henderson@microchip.com>
 <2357aab6-f2e6-54d4-0e37-63955864e94e@mind.be>
Message-ID: <878t2n8hmw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/02/2018 16:46, Joshua Henderson wrote:
 >> Qt KMS support should not explicitly depend on the availability of opengl.
 >> Don't explicitly disable KMS if opengl is not available and fallback to
 >> detecting if libdrm is available before disabling kms.
 >> 
 >> The scenario where this is necessary involves using the Qt linuxfb backend
 >> "dumb buffer" support via the DRM API. This is new in Qt 5.9 [1] and only
 >> requires KMS, but not opengl.

 > ?This sounds like we should handle the Qt 5.6 case specially.

 > ?However, on Qt 5.6, it builds fine with the -kms option, it just ends up not
 > being used. That means we have a redundant dependency on libdrm, but that
 > doesn't matter that much. Handling the Qt 5.6 case differently would make the
 > code quite a bit more complicated.

 > ?Therefore, I explained the above in the commit log an applied to master, thanks.

 > ?Sorry it took so long.

Committed to 2018.02.x and 2018.08.x with the extended commit message,
thanks.

-- 
Bye, Peter Korsgaard
