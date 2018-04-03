From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 15:45:16 +0200
Subject: [Buildroot] [PATCH] tpm2-abrmd: disable for musl
In-Reply-To: <20180402165357.8188-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Mon, 2 Apr 2018 13:53:57 -0300")
References: <20180402165357.8188-1-casantos@datacom.ind.br>
Message-ID: <871sfwqu8j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > The current version requires macros and funtions not availabe on musl
 > (TEMP_FAILURE_RETRY, srand48_r, etc). We could try to circumvent the
 > problem by means of local patches but for the moment let's disable the
 > package for musl toolchains and watch the issue reported upstream at

 >   https://github.com/tpm2-software/tpm2-abrmd/issues/237

 > Propagate the change to tpm2-tools, which has a run-time dependency on
 > tpm2-abrmd.

 > Fixes:
 >   http://autobuild.buildroot.net/results/d2fa916613d835f856d14747dc03ef9847ad6396
 >   http://autobuild.buildroot.net/results/e82ff1f7f8a4a930fbabd38353da2149cc54fd9d
 >   http://autobuild.buildroot.net/results/7aaf6a7cc384b2e52109c0c31792c0d3888bcefd
 >   http://autobuild.buildroot.net/results/a56e55fb4791a90c00906698676656969484383d
 >   http://autobuild.buildroot.net/results/7aa020d115a0a3308fee1f3528554e40076ff28d

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
