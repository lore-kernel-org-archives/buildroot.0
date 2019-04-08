From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 08 Apr 2019 20:02:07 -0300
Subject: [Buildroot] [PATCH v2] support/testing: add xserver + Mesa
 OpenGL (GLX) + glxinfo
References: <d419cda6-d51a-9c66-e0ef-10ceb1b2fbea@smile.fr>
Message-ID: <5cabd2ef8c663_2012acfc5fd214447397@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Apr 08, 2019 at 05:49 AM, Romain Naour wrote:

[snip]
>> nit, I am really unsure whether we should care about or not:
>> This is not the exact the order if we generate a defconfig.
> 
> I wrote the defconfig by "hand", I'm not sure if it's really important.

OK, let's keep it as-is.

[snip]
>> So, what about this?
>>          cmd = "glxinfo -B -display :0"
>>          output, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
>>          self.assertEqual(exit_code, 0)
>>          # Error case: "Error: couldn't find RGB GLX visual or fbconfig"
>>          for line in output:
>>              self.assertNotIn("Error", line)
>> It requires Python 2.7 but this is already the requirement to run buildroot.

Sorry, in order to be precise I should had write:
It requires Python 2 >= 2.7 or Python 3 >= 3.1
So we can use now and we won't need to change later.

> 
> That's what I tried to do using a "| grep".
> Let's use the python way :)

Great :)

> 
> Maybe we should start writing testcase in python 3 ?
> On the long term, Python 2 will be deprecated.

Sure. It is in my TODO list (for quite some time now) to move the test infra
and test cases to Python 3.


Regards,
Ricardo
