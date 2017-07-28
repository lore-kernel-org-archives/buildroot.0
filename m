From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 28 Jul 2017 14:54:06 -0700
Subject: [Buildroot] [PATCH v3] package/qt5location: handle plugins
 being conditionally built
In-Reply-To: <619ea4cf-4911-7702-3c88-4e860ed15c85@mind.be>
References: <1500925803-3453-1-git-send-email-joshua.henderson@microchip.com>
 <20170725215220.6d447778@windsurf.home>
 <49674504-df74-e429-b49f-eacf299ef15b@microchip.com>
 <619ea4cf-4911-7702-3c88-4e860ed15c85@mind.be>
Message-ID: <e4f07131-c47e-f3f6-e0fc-a96a1defb6c6@microchip.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Arnout,

On 07/28/2017 02:17 PM, Arnout Vandecappelle wrote:
> 
> 
> On 28-07-17 18:31, Joshua Henderson wrote:
>> Thomas, Peter,
>>
>> On 07/25/2017 12:52 PM, Thomas Petazzoni wrote:
> [snip]
>>> Thanks, but Peter had sent an almost identical patch a few hours
>>> before, and I've applied his patch.
>>
>> It wasn't exactly identical.  The applied patch now causes a build failure for 5.6.2:
> 
>  If you noticed that Peter's patch was wrong, you could have mentioned it in the
> commit message of your patch (below the --- line). Then Thomas might have seen
> the difference and applied your patch instead.

It was caught last night by a local build server.  Didn't notice it previously.  I
have actually been flying right along using his patch, but only with 5.9.1.  This
is only an issue with 5.6.2.

> 
> 
>>     qt5location 5.6.2 Patching
>>     Applying 0001-Fix-plugins-build-dependency.patch using patch: 
>>     patching file src/src.pro
>>     Hunk #1 FAILED at 7.
>>     Hunk #2 succeeded at 14 (offset -4 lines).
>>     1 out of 2 hunks FAILED -- saving rejects to file src/src.pro.rej
> 
>  Care to send a fix (I guess just moving the patch to the right directory)?

That should do it.  Done.

> 
>  When you do, please also add a reference to the autobuilder failure:
> 
> http://autobuild.buildroot.net/results/676abe008c9c4bddfddd7b041d8db9999e9e899d

OK.  Is there any way to subscribe to these failures?  Even better, for specific packages?

> 

...

>>
>> I also have several other patches to rev (add qt5wayland and license hashes for all of qt5).
> 
>  For the qt5wayland patch, since you wrote yourself "This needs a v3 before
> applying.", it's been marked as Changes Requested in patchwork so it won't be
> applied and probably won't be reviewed either.

OK.

Josh
