From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 15:20:31 +0200
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
Message-ID: <dbe1c07b-acac-59b8-70c8-dc10b7375a12@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 23:01, Arnout Vandecappelle wrote:
>  Hi all,
> 
>  A number of defconfigs fail to build (usually the kernel, in one case U-Boot)
> because of GCC 6. Some of these could be fixed by simply bumping the upstream
> kernel; however, we really want defconfigs to be tested on an actual board,
> otherwise there's not much point.
> 
>  I've put the people who have been involved in these defconfigs in To. Could you
> look at these defconfigs and try to fix the build with GCC 6? Anything that
> remains unfixed by the end of the month will probably be removed.

 Looks like yesterday I missed a few:

riotboard_defconfig:
https://gitlab.com/arnout/buildroot/-/jobs/28979360

telit_evk_pro3_defconfig:
https://gitlab.com/arnout/buildroot/-/jobs/28979373

toradex_apalis_imx6_defconfig:
https://gitlab.com/arnout/buildroot/-/jobs/28979374

ts4900_defconfig:
https://gitlab.com/arnout/buildroot/-/jobs/28979376


 All of these seem to have a DTS in 4.11, so perhaps we can switch to upstream?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
