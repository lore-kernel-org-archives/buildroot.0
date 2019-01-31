From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 31 Jan 2019 23:49:18 +0100
Subject: [Buildroot] flags to build Qt5 for AMD Geode LX arch ?
In-Reply-To: <c03763ec-8c68-7424-6c36-001ffaf7fa40@mind.be>
References: <bb5b237e-ba8d-6857-f475-1960a6375112@gmx.com>
 <20190129183348.GL7130@scaer>
 <56c9f95c-00bf-609b-6b07-5598499aaa20@gmx.com>
 <33183700-a3d6-6917-911e-9b4e3827c8c5@gmx.com>
 <22a54ac3-06ef-5094-ddae-88938e303c9d@gmx.com>
 <c03763ec-8c68-7424-6c36-001ffaf7fa40@mind.be>
Message-ID: <20190131234918.499ab263@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Thu, 31 Jan 2019 22:24:28 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 30/01/2019 15:39, David Picard wrote:
> > Hello,
> > 
> > I fixed it. So for the record, the solution was :
> > BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS="-no-sse2"
> > 
> > Got it from Qt's configure utility :
> > $ configure --help  
> 
>  So the proper fix would be to change qt5base.mk to pass this option
> automatically if !BR2_X86_CPU_HAS_SSE2.

Yes something like this should fix it ;-)

David would you mind to share your .config/defconfig file?

Regards,
Peter

> 
>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
