From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 16:05:17 +0200
Subject: [Buildroot] [PATCH] libpciaccess: add dependency on hwdata
In-Reply-To: <20180128235233.26989-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Sun, 28 Jan 2018 21:52:33 -0200")
References: <20180128235233.26989-1-casantos@datacom.ind.br>
Message-ID: <87zi2r7zaa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > libpciaccess requires /usr/share/hwdata/pci.ids (or pci.ids.gz, if
 > compiled with zlib support). That file is provided by the hwdata
 > package, so add it as a run-time dependency.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Is this really a hard dependency? Looking at src/common_device_name.c,
this seems to only be used in populate_vendor(), which just returns
without error if the file cannot be opened.

-- 
Bye, Peter Korsgaard
