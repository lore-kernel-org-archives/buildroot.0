From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 10:23:35 +0200
Subject: [Buildroot] [PATCH 2/9] Copy gdbserver from external toolchain
In-Reply-To: <20111017223226.5638eac7@skate>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-3-git-send-email-will_wagner@carallon.com>
 <20111017223226.5638eac7@skate>
Message-ID: <201110181023.35764.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 17 October 2011 22:32:26, Thomas Petazzoni wrote:
> See also
> 
>  [PATCH 3/4] debug: provide an option to copy the gdbserver to the
>  target
> 
> that I posted on July, 11th 2011.

 Grmbl, I missed that one and I already started improving Will's patch...  I just love wasting my time like that :-/

 [I lost my mail archive so it's a bit difficult to your to the original patch, so I'll put my comment here.]

 I notice that Will has
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDBSERVER),y)
+LIB_EXTERNAL_LIBS+=libthread_db.so
which was not there in your patch.  Is it not needed?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
