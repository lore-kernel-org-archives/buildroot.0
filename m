From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Jan 2016 10:36:54 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <CAAXf6LUpuOQVk01GnqYXqLphs3bJrcAWGA366=L+3pT+3TXFCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 22, 2016 at 10:29 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>>     mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3a2b141d90b28a2954fa0ad3104cba81d648d2a3/
>>       mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/70aa227c8a289631c2973474cfaef5973756dd5c/
>>     mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/2b8c777c76b7e5d5a426045f5a3872d6b71faa56/
>>       mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3f19dd459400ac7fca39e69dd280def6a547f8b6/
>
> tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_create/tirpc_authdes_create.c:50: undefined reference to `authdes_create'
> collect2: error: ld returned 1 exit status
>
> Thomas, you touched the ltp-testsuite/tirpc handling recently IIRC.
> Interestingly, this problem only occurs on MIPS apparently. Thomas,
> Vicente, can you have a look ?

Yes, I have noticed this same problem very recently here and have a
local patch which I will submit. It seems my original patch did not
disable all required tests.

/Thomas
