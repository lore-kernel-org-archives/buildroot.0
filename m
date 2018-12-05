From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Dec 2018 11:41:33 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181205104401.60112506@windsurf>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <dc8cc6eb-59ab-2913-f094-cf5ae48eec4d@mind.be>
 <20181205090410.0f08dba3@windsurf>
 <47a97a05-e9c1-41e9-2576-2aa31f69f401@mind.be>
 <20181205104401.60112506@windsurf>
Message-ID: <b2c039bb-94bc-8794-3576-16dfc67d2c20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/12/2018 10:44, Thomas Petazzoni wrote:
> The check-host-rpath script is not checking for the presence of
> libraries. 

 Line 48 (before this patch):

	[ -e "${hostdir}/lib/${lib}" ] && return 0

 It *does* check for the presence of libraries, because rpath is only needed
when it uses a library from host_dir. So, the confusing thing is that we check
here that the library is present in per-package/A/host/lib while the rpath is
per-package/B/host/lib. That's what makes it so unintuitive.

 Regards,
 Arnout


> Nowhere it verifies that the NEEDED fields in host binaries
> match libraries found in the RPATH listed in the binaries.
