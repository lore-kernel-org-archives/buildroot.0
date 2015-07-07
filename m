From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Tue, 7 Jul 2015 10:42:07 +0200
Subject: [Buildroot] [PATCH v2] openssl: always build apps
In-Reply-To: <20150707103129.454a1426@free-electrons.com>
References: <1436187968-84565-1-git-send-email-benoit@wsystem.com>
 <20150707103129.454a1426@free-electrons.com>
Message-ID: <559B90DF.4080906@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 7 Jul 2015 10:31, Thomas Petazzoni wrote:
> On Mon,  6 Jul 2015 15:06:08 +0200, Beno?t Th?baudeau wrote:
> This patch is causing some build failures:
> 
>   http://autobuild.buildroot.org/results/cbb/cbb35f2582f1cfeb3d11cb4952a80784ff660baf/build-end.log
> 
> Now, applications are being built on noMMU systems. But when using
> Blackfin FLAT, libdl is not available. And generally speaking libdl is
> not available for static only builds.
> 
> According to the PROBLEMS file in openssl source code, passing no-dso
> (which we are doing) is not sufficient, and the Makefile need to be
> hand-edited to remove the -ldl flag. Could you try that and submit a
> patch fixing this build issue?
> 
> Thanks!

Yes, I'll look into it.

Best regards,
Beno?t
