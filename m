From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 10:14:10 +0100
Subject: [Buildroot] [PATCH] quagga: Create /var/run/quagga on sysv
In-Reply-To: <20161221100324.0f4c89e0@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Dec 2016 10:03:24 +0100")
References: <1482293253-61002-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161221100324.0f4c89e0@free-electrons.com>
Message-ID: <877f6t63vh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Thanks for this patch!

 > On Tue, 20 Dec 2016 22:07:33 -0600, Matt Weber wrote:

 >> diff --git a/package/quagga/S99quagga b/package/quagga/S99quagga
 >> new file mode 100644
 >> index 0000000..e964387
 >> --- /dev/null
 >> +++ b/package/quagga/S99quagga
 >> @@ -0,0 +1,6 @@
 >> +#!/bin/sh
 >> +
 >> +if [ ! -d /var/run/quagga ]; then
 >> +       mkdir -p /var/run/quagga
 >> +       chown quagga:quagga /var/run/quagga
 >> +fi

 > I think we would prefer to have a real init script, that not only
 > creates /var/run/quagga, but also starts quagga itself. I.e something
 > that does the same as the systemd unit file.

Yes, agreed. Also notice that the explicit /var/run/quagga check isn't
needed when you use mkdir -p.

-- 
Bye, Peter Korsgaard
