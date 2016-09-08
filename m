From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 8 Sep 2016 02:06:00 +0200
Subject: [Buildroot] [PATCH 1/1] php: add --enable-mysqlnd to configure
 options when using mysql extensions
In-Reply-To: <57D0A48C.8060106@gmail.com>
References: <20160907154857.3147-1-bluemrp9@gmail.com>
 <20160907235514.1779aeb6@free-electrons.com>
 <f86e9d4a-64ab-192b-6aaf-27b317eebdbc@je-eigen-domein.nl>
 <57D0A48C.8060106@gmail.com>
Message-ID: <44537d0b-3c8b-edd0-1286-7f02e06694b9@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2016 01:36 AM, Ryan Coe wrote:
> Floris, Thomas, All,
>
> After applying my patch and rebuilding my system, I was still having 
> trouble.
> I tracked it down to needing to set mysqli.default_socket in my 
> php.ini configuration.
> This wasn't necessary before.  I am going to revert my patch, rebuild, 
> and test again.
> This might have been a false alarm.  I will report back my findings.

Hmm, perhaps there needs to be an --with-mysql-sock option added to set 
the default socket path to the right location for the buildroot MySQL 
server.
I tend to use TCP instead for communication, so did not notice there may 
be something wrong with localhost through unix sockets.


BTW did notice the MySQL server version shipped by buildroot is old and EOL.
If you are planning to use that, you might want to look at upgrading it.


Yours sincerely,

Floris Bos
