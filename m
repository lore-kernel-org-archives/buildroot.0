From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 22:03:12 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160118215347.6447b77c@gmx.net>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <20160118215347.6447b77c@gmx.net>
Message-ID: <20160118220312.7669211d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, 18 Jan 2016 21:53:47 +0100, Peter Seiderer wrote:

> This two enums entered the linux kernel with commit '[media] add DTMB support for DVB API' [1], at least
> since linux-3.10 (did no exact search)...., may be depend GST1_PLUGINS_BAD_PLUGIN_DVB on
> TOOLCHAIN_HEADERS_AT_LEAST_3_10 ?

Thanks for the research. This commit dates back from v3.7:

$ git tag --contains 224b6642f5e82a1b21f6b552c799fa02e527d542 | grep ^v | sort -V | head -1
v3.7

I've committed a patch that fixes this. Many thanks for your
investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
