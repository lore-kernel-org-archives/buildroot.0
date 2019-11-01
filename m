From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Nov 2019 08:07:11 +0100
Subject: [Buildroot] [PATCH] package/rsyslog: bump to 8.1910.0
In-Reply-To: <20191030131328.26117-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 30 Oct 2019 08:13:28 -0500")
References: <20191030131328.26117-1-matthew.weber@rockwellcollins.com>
Message-ID: <87lft02hy8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The rsyslog project removed the ability to toggle libcurl dependencies in
 > https://github.com/rsyslog/rsyslog/commit/dc95ef09bdb07cfb7b7df4ce87df629fc2c94f8f,
 > however there are a series of options that now add a libcurl dependency.

 > This bump disables the following options to prevent libcurl as a new dependency.
 > 	--disable-elasticsearch
 >         --disable-clickhouse
 >         --disable-omhttp
 >         --disable-fmhttp
 >         --disable-imdocker
 >         --disable-omhttpfs
 >         --disable-mmkubernetes

Is that the only dependency they have? Do they add a lot of size? Do
they need TLS support in libcurl? If not, we might consider enabling
them when libcurl is enabled.

But OK, that can be done later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
