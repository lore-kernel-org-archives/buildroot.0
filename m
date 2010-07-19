From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Mon, 19 Jul 2010 17:40:05 +0100
Subject: [Buildroot] buildroot not using my proxy settings
In-Reply-To: <EE93B8B6CB04054E896A0763A45EF9EB01A51CFD@SONDA-EXCH01.sonda.com>
References: <EE93B8B6CB04054E896A0763A45EF9EB01A51CFD@SONDA-EXCH01.sonda.com>
Message-ID: <AB12B32E73474741A2C5361C433A44DE01F2D86A@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Does anyone know if there is another thing to configure to get
> buildroot to use my proxy settings?
> 
> My system is ubuntu linux 10.04 LTS and I'm using buildroot
> v23434. Thanks in advance.

It's not really anything to do with Buildroot, but hey... I had the same
problem in Ubuntu 10.04, try:

export no_proxy=$(echo $no_proxy | sed 's/,$//')

As long as wget works, then Buildroot shouldn't have any problems.

Phil
