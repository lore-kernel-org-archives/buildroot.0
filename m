From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 9 Apr 2014 01:51:08 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-07
In-Reply-To: <20140408234145.4ed87c17@skate>
References: <20140408063009.EA284100CF4@stock.ovh.net>
 <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
 <20140408234145.4ed87c17@skate>
Message-ID: <CAMo8BfLKSdQnr2+a-WDCj9zJAPgXyitcM42fMDYhvDkzPfeR2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 9, 2014 at 1:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Max Filippov,
>
> On Wed, 9 Apr 2014 01:00:51 +0400, Max Filippov wrote:
>> On Tue, Apr 8, 2014 at 10:30 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Build statistics for 2014-04-07
>> [...]
>> >     xtensa |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/959b77fa2c1f13b1958b234803437e09734e882e/
>>
>> Couldn't reproduce. But I had to disable BR2_PACKAGE_HOST_SAM_BA,
>> otherwise it refused to build with the following message:
>>
>> Your Buildroot configuration uses pre-built tools for the x86 architecture,
>> but your build machine uses the x86-64 architecture without the 32
>> bits compatibility library.
>
> I think we can safely assume that the problem is not due to
> BR2_PACKAGE_HOST_SAM_BA. I'll try to reproduce the same build failure
> on the autobuilder, and gather the config.log file of php. I'll let you
> know.

The tail of the failing build log:

...
checking for MySQL support... yes
checking for specified location of the MySQL UNIX socket... no
checking for mysql_close in -lmysqlclient... no
checking for mysql_error in -lmysqlclient... no
configure: error: mysql configure failed. Please check config.log for
more information.
make: *** [/home/test/test/2/output/build/php-5.5.11/.stamp_configured] Error 1

in my build the same place looks like this:

...
checking for MySQL support... yes
checking for specified location of the MySQL UNIX socket... no
checking for mysql_close in -lmysqlclient... yes
checking for MySQL UNIX socket location... no
checking for MySQLi support... no
checking whether to enable embedded MySQLi support... no
checking for Oracle Database OCI8 support... no
checking whether to enable Zend OPcache support... no
checking whether to enable pcntl support... yes
checking for fork... yes
...

so something must have happened with MySQL.

-- 
Thanks.
-- Max
