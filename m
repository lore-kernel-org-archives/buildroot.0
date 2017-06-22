From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Jun 2017 09:57:09 +0200
Subject: [Buildroot] [PATCH 00/14] toolchain-external: remove support
 for glibc before 2.17
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <02e9b62f-282c-ce57-a706-ccbbb33a5f0f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Baruch,

On 16-06-17 05:32, Baruch Siach wrote:
> As discussed[1] recently on the list it is time to remove support for glibc 
> older than 2.17. This does not mean that toolchains with old glibc will stop 
> working. It only means that we stop fixing older glibc build issues. In 
> particular, the need to link with librt for clock_* system calls.
> 
> The only significant user visible change in this series is the removal of 
> CodeSourcery toolchains for x86 and sh.
> 
> Two patches update a comment section and the manual to take into account the 
> removal of toolchain in this series and in previous commits. A few more 
> per-package patches remove local patches for the glibc librt issue.
> 
> The first patch is an unrelated fix to the external toolchain section in the 
> manual.
> 
> [1] http://patchwork.ozlabs.org/patch/773384/
> 
> Baruch Siach (14):
>   docs/manual: update external toolchain advantages list
>   toolchain: remove CodeSourcery x86 toolchain
>   toolchain: remove CodeSourcery sh toolchain
>   package: remove CodeSourcery sh dependencies
>   toolchain-external: update list of toolchains
>   docs/manual: drop mention of removed external toolchains
>   swupdate: don't link with librt
>   aiccu: don't link with librt
>   libv4l: don't link with librt
>   e2fsprogs: don't link with librt
>   liboping: no need to check for clock_gettime
>   openipmi: no need to check for clock_gettime
>   lirc-tools: no need to check for clock_gettime

 After all of these have been applied, "git grep -e -lrt" still yields quite a
few results that at first sight could also be removed. Was that intentional or
did you just miss them? Perhaps also grep for clock_gettime.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
