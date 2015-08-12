From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 13 Aug 2015 00:54:00 +0200
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
In-Reply-To: <CAE21AQr13hYAsTkcD2_qRjSHme8aCHPDZDt2CWMeo8Fi4jptHw@mail.gmail.com>
References: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
 <20150811114020.GD25261@tarshish>
 <CAE21AQqJwCZMRDj3C+JEHjoNJvprxhZusW6TTfNWVwLaL7UziA@mail.gmail.com>
 <20150812043816.GG25261@tarshish>
 <CAE21AQr13hYAsTkcD2_qRjSHme8aCHPDZDt2CWMeo8Fi4jptHw@mail.gmail.com>
Message-ID: <55CBCE88.1000703@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/2015 07:16 AM, Charles Manning wrote:
>>> Actually udev would work too.
>> Recent kernels gained the ability to load firmware directly without any help
>> form userspace, so this is probably another option.
> Well not without rewriting the wf111 driver and the associated
> prebuilt "helper" binaries it comes with...

mdev will not launch any of those "prebuild helper binaries" 
automatically, unless you added any explicit rules to tell it to in 
mdev.conf
If you could make it work by just enabling mdev, it is more likely mdev 
only helped by serving files from /lib/firmware to the module, which -as 
mentioned- is not strictly necessary in recent kernels.


Yours sincerely,

Floris Bos
