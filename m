From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 08:17:28 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303090219.65a08cc7@skate>
References: <20140303073010.B46B51015B7@stock.ovh.net>
 <20140303090219.65a08cc7@skate>
Message-ID: <531464C8.1030201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2014 05:02 AM, Thomas Petazzoni wrote:

>>    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/568d7fd5a6e6cd8a8e23184d7f977ce812b887fd/
> 
> Maybe a kernel headers problem. Gustavo ?

Hi.
Definitely.
That toolchain uses 2.6.38-ish kernel headers but include/linux/socket.h
has issues, it doesn't define sa_family_t which vanilla does, hence the
breakage.
We can either disable libnftnl for that toolchain or consider removing
it since it's getting old and there doesn't seem to be any new version
forthcoming for some time now.
Regards.
