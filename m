From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 4 Mar 2016 16:13:29 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-03
In-Reply-To: <20160304073022.647E6102375@stock.ovh.net>
References: <20160304073022.647E6102375@stock.ovh.net>
Message-ID: <CAAMH-ytHBRRC7A3aOynB6TVyJgr82dge8s1pMemreE4N_aXF5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Fri, Mar 4, 2016 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2016-03-03
> ===============================
>
>         success : 175
>        failures : 115
>        timeouts : 0
>           TOTAL : 290
>
> Classification of failures by reason
> ====================================
>
>               host-libcap-2.24 | 22
>      python-cryptography-1.2.2 | 22
>            libimxvpuapi-0.10.1 | 5

I've looked at the libimxvpuapi failures and they are actually imx-vpu failures.

The latest imx-vpu only builds if the PLATFORM is MX27, MX53 or MX6Q
but our default is MX25. So the imx-vpu package just does nothing and
then libimxvpuapi fails during configuration because libvpu is
missing.

I'm looking into a solution but those FREESCALE_IMX_PLATFORM_* are not
easy to play with.

Regards,
Gary
