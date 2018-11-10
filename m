From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:15:21 -0200
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for
 python packages v2
References: <20181106085656.425efe64@windsurf>
Message-ID: <5be63f397da7b_2e452ac7f04fdb9c113de@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, Nov 06, 2018 at 05:56 AM, Thomas Petazzoni wrote:

> On Mon, 05 Nov 2018 23:57:15 -0200, Ricardo Martincoski wrote:
> 
>> >  - Use an integer for the Python version variable, rather than a
>> >    string, there is really no need for this to be a string I believe ?  
>> 
>> You are correct. There is no need for a string. I will use an integer.
> 
> On the other hand, this python_version = 2/3 is only one line, and it
> saves only one line in the config fragment, BR2_PACKAGE_PYTHON=y or
> BR2_PACKAGE_PYTHON3=y.
> 
> So we replace one fairly explicit line:
> 
> 	BR2_PACKAGE_PYTHON=y
> 
> by just another line, which requires going to the base class to
> understand what is does:
> 
> 	python_version = 2
> 
> I.e, I am wondering if this refactoring is really useful in the end ?

Please let me send a v3, based from v1, doing the minimum to accomplish this
goal:
 - add common logic to test python packages with a script in a separate file
   instead of inline in the testcase
... and following these ideas:
 - use separate class
 - use no hacks/tricks
 - use explicit code

From this v3 we can decide the direction to follow: whether to drop the series
or do some additional change, either as v4 or as followup patches.


Regards,
Ricardo
