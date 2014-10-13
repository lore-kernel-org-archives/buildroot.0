From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Oct 2014 18:34:41 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <87fvess4zn.fsf@dell.be.48ers.dk>
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>	<543A9CC0.7020802@mind.be>
 <87fvess4zn.fsf@dell.be.48ers.dk>
Message-ID: <543BFF21.7040609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/14 11:17, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 18/08/14 11:54, Thomas Petazzoni wrote:
>  >> The ecryptfs-utils scripts require the 'getent' program to be
>  >> installed to find the home directory of users. However, Buildroot
>  >> currently never installs this program, and therefore bug #7142 was
>  >> reported, explaining that ecryptfs-utils is not working properly.
>  >>
>  >> In normal Linux systems, the getent program is provided by glibc, and
>  >> allows to query not only /etc/passwd, but also other NSS databases
>  >> such as LDAP and others.
>  >>
>  >> This solution allows to install a NSS-capable getent when glibc/eglibc
>  >> is used, and otherwise to rely on uClibc's wrapper script.
>  >>
>  >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>  > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  >  Fixes a (run-time) bug, so please apply.
>
> We have some autobuild issues, like:
>
> http://autobuild.buildroot.net/results/820/8207527e3e42a226649c5f5fbf62fa8a77b89467/
>
> (codesourcery mips 2013.05)
>
> Should we perhaps fallback to the uClibc emulation version if the
> toolchain doesn't provide it?
>

 The toolchain does provide it, but it's in a different path
(libc/usr/lib/bin/getent).

 Thomas, did you test this at all with a CodeSourcery toolchain because it looks
like it's never in sysroot/usr/bin...

 I guess the external toolchain infrastructure should copy it like it does for
the libraries.

 Regards,
 Arnout

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
