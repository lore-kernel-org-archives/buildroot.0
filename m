From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 25 Mar 2018 01:02:34 -0300 (BRT)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-03-23
In-Reply-To: <20180324070008.0BD1B208BA@mail.bootlin.com>
References: <20180324070008.0BD1B208BA@mail.bootlin.com>
Message-ID: <835806455.219726.1521950554069.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Saturday, March 24, 2018 4:00:08 AM
> Subject: [autobuild.buildroot.net] Your build results for 2018-03-23

> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-03-23, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
>    nios2 | tpm2-abrmd-1.3.0 | http://autobuild.buildroot.net/results/ce8fe8ac9cf0db01ae15d476ea714ff176965cfb
>    nios2 |   tpm2-tss-1.4.0 | http://autobuild.buildroot.net/results/09ce8f05e28c0219f499ce55130e896cae0c8b45

The CodeSourcery NIOSII toolchain does not support SSP.

Fixed by https://patchwork.ozlabs.org/patch/890608

>    nios2 | tpm2-abrmd-1.3.0 | http://autobuild.buildroot.net/results/22c473e36e1d45b33403182384fe738a9cb08dc5
>    nios2 |   tpm2-tss-1.4.0 | http://autobuild.buildroot.net/results/21bc376184989162a219d0db8973bc58a0866696
>    nios2 |   tpm2-tss-1.4.0 | http://autobuild.buildroot.net/results/016d251fcdc02e2638d8e084540b0f97ea595615
>    nios2 |   tpm2-tss-1.4.0 | http://autobuild.buildroot.net/results/33e60b96ec23fe0f2a8f4150cbba3b4ab1e8d3ba

The br-nios2-full-2017.11-rc1.tar.bz2 toolchain does not support SSP but
the configuration selects BR2_TOOLCHAIN_EXTERNAL_HAS_SSP, which is wrong.

Detected by https://patchwork.ozlabs.org/patch/890608

> mips64el | tpm2-tools-3.0.3 | http://autobuild.buildroot.net/results/ae1e151576b365380ab711a1b8ffcd92ad0050e2
>     i686 | tpm2-tools-3.0.3 | http://autobuild.buildroot.net/results/ee80c2fe54c89589532efd47eb93bd27637c690f

Fixed by https://patchwork.ozlabs.org/patch/890606

>      arm |   tpm2-tss-1.4.0 | http://autobuild.buildroot.net/results/c35fb61315730e26b1a019fe1a4f41fac50fa0ed

Fixed in commit 86ad2d92070c3024b2cf5de74dede294b56d5fd2.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
