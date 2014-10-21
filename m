From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 10:15:19 -0300
Subject: [Buildroot] [PATCH] eudev: add input group
In-Reply-To: <20141021075847.GA9754@pc-eric>
References: <1413838745-14008-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020231802.204b1e27@free-electrons.com> <20141021075847.GA9754@pc-eric>
Message-ID: <54465C67.1020103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/2014 04:58 AM, Eric Le Bihan wrote:

>> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> I've seen the same issue a couple of days ago.
>>
>> Does systemd needs a similar fix?
> 
> Yes it does.
> 
> In my setup, I modified system/skeleton/etc/group to add "input:x:31:"
> 
> I'll send a patch similar to the eudev one.

Hold off on applying the patch, mkusers doesn't handle making groups
without users gracefully:

...scripts/mkusers: line 369: [: too many arguments
...scripts/mkusers: line 376: [: too many arguments
...scripts/mkusers: line 400: [: input: integer expression expected
...scripts/mkusers: line 408: [: input: integer expression expected

I can respin adding an input user to match, another option is to handle
the scenario in mkusers.
Regards.
