From: Robert Carter <r.carter@cs.auckland.ac.nz>
Date: Fri, 4 Aug 2006 12:36:58 +1200
Subject: [Buildroot] make troubles
In-Reply-To: <200608031639.17238.rob@landley.net>
References: <1154584855.22773.13.camel@turing>
	<200608031639.17238.rob@landley.net>
Message-ID: <94AB2BC3-0641-400D-9544-89338AD41BE9@cs.auckland.ac.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did a svn update to 15773 and ran the build once again with the  
same result.

The good news is that when

BR_PACKAGE_BUSYBOX_SNAPSHOT

is not set and busybox-1.2.1 is used the build succeeds. So perhaps  
the problem is with some of the recent 'testing' busybox commits.

Your help much appreciated.
Rob

On 4/08/2006, at 8:39 AM, Rob Landley wrote:

> On Thursday 03 August 2006 2:00 am, Robert Carter wrote:
>> make[1]: Entering directory `/home/rob/buildroot/build_i686/busybox'
>>   CC modutils/lsmod.o
>> /home/rob/buildroot/build_i686/busybox/modutils/lsmod.c: In function
>> `lsmod_main':
>> /home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:96: warning:
>> dereferencing type-punned pointer will break strict-aliasing rules
>> /home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:114: warning:
>> dereferencing type-punned pointer will break strict-aliasing rules
>> make[2]: *** [/home/rob/buildroot/build_i686/busybox/modutils/ 
>> lsmod.o]
>> Error 1
>
> Odd.  I'm not seeing that.  Still, I just committed svn 15773 in an  
> attempt to
> make this go away.  Try now?
>
> If that doesn't work, you could always use the stable version of  
> BusyBox
> (1.2.1).  We have actual releases which are recent enough to  
> matter. :)
>
> Rob
> -- 
> Never bet against the cheap plastic solution.
