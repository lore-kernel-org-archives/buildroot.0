From: Neil Cherry <ncherry@linuxha.com>
Date: Wed, 08 Jul 2009 11:19:57 -0400
Subject: [Buildroot] Following direction, but failing to compile
In-Reply-To: <87a5b0800907070308y1aa17e91x591256e28f8879a7@mail.gmail.com>
References: <4A4CF6CB.40201@linuxha.com>
	<87a5b0800907070308y1aa17e91x591256e28f8879a7@mail.gmail.com>
Message-ID: <4A54B91D.4070701@linuxha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Newton wrote:
> On Thu, Jul 2, 2009 at 7:04 PM, Neil Cherry<ncherry@linuxha.com> wrote:

>> When I'm compiling all goes well until I hit this:
>>
>>        :
>>  DEPMOD  2.6.29.4-test
>> make[1]: Leaving directory
>> `/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/linux-2.6.29.4'
>> + rm -f
>> /home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/build
>> /home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/source
>> + /home/njc/stuff/buildroot-2009.05/build_i586/staging_dir/bin/i586-linux-depmod26 -b
>> /home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root 2.6.29.4
>> WARNING: Couldn't open directory
>> /home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4: No
>> such file or directory
>> FATAL: Could not open
>> /home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/modules.dep.temp
>> for writing: No such file or directory
>> make: ***
>> [/home/njc/stuff/buildroot-2009.05/project_build_i586/LORHA/root/lib/modules/2.6.29.4/modules.dep]
>> Error 1
>>
>> I'm having trouble finding where the sequence of commands are
>> executed so I can figure out why the directory is not being created.
>>
>> I can go into the linux-2.6.29.4 directory and manually compile
>> the kernel with no errors.
>>
>> Any pointers would be appreciated.
> 
> It looks like it's the modules_install target in the kernel Makefile
> that is failing. Can you make that target successfully i.e. make
> modules_install in the kernel tree?

Sorry for the delay.

Yes when I go into the kernel directory I can compile the modules
with no problems. My fix was to add a mkdir just after the rm -rf
in that section of the make file (I can't find it right now).

I'll find that info and post it here so we can see if it makes
any sense to anyone.

Thanks

-- 
Linux Home Automation         Neil Cherry       ncherry at linuxha.com
http://www.linuxha.com/                         Main site
http://linuxha.blogspot.com/                    My HA Blog
Author of:    	Linux Smart Homes For Dummies
