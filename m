From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 00:30:16 +0200
Subject: [Buildroot] [PATCH v2/next 1/4] brotli: new package
In-Reply-To: <20180402230718.GB16681@momiji> (Adrian Perez de Castro's message
 of "Mon, 2 Apr 2018 23:07:18 +0100")
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-2-aperez@igalia.com>
 <20180402222509.6afc6ec4@windsurf> <20180402230718.GB16681@momiji>
Message-ID: <87tvstjl6v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Brotli is detected by libcurl, and it causes a build failure, at least
 >> in some situations:
 >> 
 >> http://autobuild.buildroot.net/results/64b/64bc0dfe284206390ae0680b94c0876863a3c0f3/build-end.log
 >> 
 >> Could you have a look ?

 > Sure, from the looks of it the curl config scripts are not adding
 > -lbrotlicommon when doing static builds, hence the missing symbols. I'll
 > see what I can come up with, likely this will end up with a patch sent to
 > curl upstream.

 > Now it's a bit late for me, so I'll continue with it tomorrow.

I already committed Baruch' fix:

https://git.buildroot.net/buildroot/commit/?id=e7d658e0291b78553bf4eca704f0d0202bcf031f

-- 
Bye, Peter Korsgaard
