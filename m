From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 Mar 2016 13:08:44 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-16
In-Reply-To: <20160317073023.E2518102714@stock.ovh.net>
References: <20160317073023.E2518102714@stock.ovh.net>
Message-ID: <56EA9E4C.1010302@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 17/03/2016 08:30, Thomas Petazzoni wrote:
[...]
>     mips64el |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/f8c41f35ab56fac86f2877b09a60924256f57028/

Doesn't reproduce here, so it might be another parallel build bug.

But the weird thing is that it's building in
build/libpjsip-2.4.5/third_party/build/gsm, when we clearly add
--disable-gsm.

...and it turns out that --disable-gsm does not exist at all. It's named
--disable-gsm-codec. Will fix ASAP.

-- 
Luca
