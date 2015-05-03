From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 23:14:13 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mono: bump to version 4.0.1
In-Reply-To: <CA+TH9Vkxv4xdt+WZpkhyQa-LF-8J+3LDq-K37fhA0OgqZEQ_Tg@mail.gmail.com>
 (Angelo Compagnucci's message of "Sun, 3 May 2015 22:37:19 +0200")
References: <1430402595-5355-1-git-send-email-angelo.compagnucci@gmail.com>
 <1430402595-5355-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150503153134.5f5764f4@free-electrons.com>
 <CA+TH9Vkxv4xdt+WZpkhyQa-LF-8J+3LDq-K37fhA0OgqZEQ_Tg@mail.gmail.com>
Message-ID: <877fsps6sa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

Hi,

>> /usr/bin/install: cannot create regular file
 >> `/home/peko/autobuild/instance-0/output/host/usr/lib/mono/xbuild-frameworks/.NETFramework/v3.0/RedistList/FrameworkList.xml':
 >> File exists/usr/bin/install: cannot create regular file
 >> `/home/peko/autobuild/instance-0/output/host/usr/lib/mono/xbuild/Microsoft/Portable/v4.5/Microsoft.Portable.Common.targets':
 >> File exists
 >> 
 >> Can you investigate?

 > Sure! Honestly it seems a little strange for me, I had several
 > compilation test and a system with mono running for a side project and
 > this is not happened.

 > Tomorrow I will look to it.

It looks like a parallel build issue with high BR2_JLEVEL settings. We
could move to MAKE1 but that will probably slow down the build quite a bit.

-- 
Bye, Peter Korsgaard
