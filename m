From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Apr 2015 00:41:53 +0200
Subject: [Buildroot] [PATCHv2 11/21] pkg-download: extend DOWNLOAD_INNER,
 add a SOURCE_CHECK macro
In-Reply-To: <20150414222545.GD4053@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413210024.GK29025@free.fr> <552D732C.3060907@mind.be>
 <20150414222545.GD4053@free.fr>
Message-ID: <552D97B1.5010705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/15 00:25, Yann E. MORIN wrote:
> In the ned, does source-check really makes sense?
> 
> Let me rephrase...
> 
> What's the purpose of source-check?
> 
> As far as I can see, there are two use-cases:
> 
>   - for us Buildroot devs: check that an upstream still provides a
>     resource;
> 
>   - for a standard user to check if he can get the source of his set of
>     packages.
> 
> But is that really necessary?
> 
> For a user, what can he do if the package can't be downloaded (i.e. not
> in upstream and not on our mirror)? Nothing...
> 
> For us, all we need to know is that something can't be downloaded so we
> can bump the package (or point it to our mirror). We have autobuilders
> to catch download failures.
> 
> So, does it make sense to keep source-check at all?


 I was thinking the same thing, I can't really see a use case for it. Actually,
same thing for external-deps.

 We could rename source-check to deprecated-source-check and see who complains.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
