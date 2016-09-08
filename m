From: Ryan Coe <bluemrp9@gmail.com>
Date: Thu, 8 Sep 2016 08:47:21 -0700
Subject: [Buildroot] [PATCH 1/1] php: add --enable-mysqlnd to configure
 options when using mysql extensions
In-Reply-To: <44537d0b-3c8b-edd0-1286-7f02e06694b9@je-eigen-domein.nl>
References: <20160907154857.3147-1-bluemrp9@gmail.com>
 <20160907235514.1779aeb6@free-electrons.com>
 <f86e9d4a-64ab-192b-6aaf-27b317eebdbc@je-eigen-domein.nl>
 <57D0A48C.8060106@gmail.com>
 <44537d0b-3c8b-edd0-1286-7f02e06694b9@je-eigen-domein.nl>
Message-ID: <57D18809.8060701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, Thomas, All,

I did build the system without my patch and was able to make everything 
work after defining the MySql socket location in my php.ini file.  I 
guess my patch can be marked rejected.  I was thrown off after looking 
at the build log.  The statement "checking whether to enable mysqlnd... 
no" from the configure step led me to think that that mysqlnd was not 
getting built.  If desired, I can submit a patch to add --with-mysql-sock.

On a side note, I am not using MySql version supplied by Buildroot.  I 
have replaced MySql with MariaDB 10.0.

On 09/07/2016 05:06 PM, Floris Bos wrote:
> On 09/08/2016 01:36 AM, Ryan Coe wrote:
>> Floris, Thomas, All,
>>
>> After applying my patch and rebuilding my system, I was still having 
>> trouble.
>> I tracked it down to needing to set mysqli.default_socket in my 
>> php.ini configuration.
>> This wasn't necessary before.  I am going to revert my patch, 
>> rebuild, and test again.
>> This might have been a false alarm.  I will report back my findings.
>
> Hmm, perhaps there needs to be an --with-mysql-sock option added to 
> set the default socket path to the right location for the buildroot 
> MySQL server.
> I tend to use TCP instead for communication, so did not notice there 
> may be something wrong with localhost through unix sockets.
>
>
> BTW did notice the MySQL server version shipped by buildroot is old 
> and EOL.
> If you are planning to use that, you might want to look at upgrading it.
>
>
> Yours sincerely,
>
> Floris Bos
>
