From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Dec 2012 00:52:40 +0100
Subject: [Buildroot] Results of an all-package build
In-Reply-To: <871ueqhna8.fsf@dell.be.48ers.dk>
References: <50C9901D.2020704@mind.be> <871ueqhna8.fsf@dell.be.48ers.dk>
Message-ID: <50D25348.9050806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/12/12 01:07, Peter Korsgaard wrote:
>   Arnout>   midori and jamvm are not built because they depend on the above.
>
> Interesting, and better than I feared;)  Do you have the build errors
> archived somewhere? I would like to see atleast the classpath issue.

  FYI, the classpath issue occurs when Qt is enabled. It's configure.ac 
uses AC_CHECK_FILE which isn't supported when cross-compiling. It should 
use AC_CHECK_HEADER instead.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
