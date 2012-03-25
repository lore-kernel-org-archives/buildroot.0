From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 20:55:04 +0200
Subject: [Buildroot] [PATCH] New package: zxing
In-Reply-To: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
References: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <201203252055.04278.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 20 March 2012 01:56:49 Frank Hunleth wrote:

[snip]
> +diff --git a/cpp/SConscript b/cpp/SConscript
> +index 51c191d..584ae17 100644
> +--- a/cpp/SConscript
> ++++ b/cpp/SConscript
> +@@ -8,6 +8,12 @@ vars = Variables()
> + vars.Add(BoolVariable('DEBUG', 'Set to disable optimizations', 1))
> + vars.Add(BoolVariable('PIC', 'Set to 1 for to always generate PIC code', 0))
> + env = Environment(variables = vars)
> ++
> ++TARGET_CROSS = ARGUMENTS.get('TARGET_CROSS', '')
> ++env.Replace(CXX = TARGET_CROSS + 'gcc')
> ++env.Replace(AR = TARGET_CROSS + 'ar')
> ++env.Replace(RANLIB = TARGET_CROSS + 'ranlib')

 It's a pity that scons doesn't provide a way to put things in the 
environment from the command line.  Well, probably it does provide
a way to do that but I couldn't find it either :-)

 Would it help to use buildroot's host-scons rather than the
packaged scons?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
