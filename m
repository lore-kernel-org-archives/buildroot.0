From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:30:12 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mdadm: bump version to 4.0
In-Reply-To: <20170805094935.18967-1-bernd.kuhls@t-online.de>
References: <20170805094935.18967-1-bernd.kuhls@t-online.de>
Message-ID: <8798554c-031f-0488-5257-20ffc8636d40@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-08-17 11:49, Bernd Kuhls wrote:
> We need to use -DNO_COROSYNC -DNO_DLM, otherwise the build will fail
> because the checks used in Makefile for host headers are not cross-
> compile friendly:
> 
> http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch2
> http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=d15a1f72bd92bc4724ee94b2ae8132633ffeb72b#patch1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 For this one, I updated the commit message a little:

    This version of mdadm can optionally use the corosync and libdlm
    packages. However, it checks for their presence by directly probing the
    host /usr/include, which fails for cross-compilation:


http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch2

http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=d15a1f72bd92bc4724ee94b2ae8132633ffeb72b#patch1

    Since Buildroot doesn't package either corosync nor libdlm, disable
    them explicitly with -DNO_COROSYNC -DNO_DLM.



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
