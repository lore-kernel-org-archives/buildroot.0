From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 22 Nov 2018 00:39:23 -0200
Subject: [Buildroot] [RFC 1/4] support/testing: add perl test
References: <CAB0FRsuJV2wv8QqtFdZQkgdbOWQqE0=6pjvAXHmca30zc9Xd4A@mail.gmail.com>
Message-ID: <5bf616db678fd_17c33fb41a00a68c70974@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Nov 21, 2018 at 02:26 PM, Fran?ois Perrad wrote:

> Le lun. 19 nov. 2018 ? 02:11, Ricardo Martincoski <
> ricardo.martincoski at gmail.com> a ?crit :
[snip]
>> > +        cmd = "perl -v"
>>
>> What about using this instead?
>>         cmd = "perl -v | grep 'This is perl 5'"
>>
> 
> As tester, I don't like this kind of code, because I never know which exit
> code is available, the one from perl or the one from grep.
> Code written for test must be obvious.
> See the following example:
> 
> #!/usr/bin/env python
> import unittest
> import subprocess
> 
> class DeveloperWay(unittest.TestCase):
>     def testPerl(self):
>         retcode = subprocess.call("perl -v | grep 'This is perl 5'",
> shell=True)
>         self.assertEqual(retcode, 0)
> 
> class TesterWay(unittest.TestCase):
>     def testPerl(self):
>         retcode = subprocess.call('perl -v', shell=True)
>         self.assertEqual(retcode, 0)
>         output = subprocess.check_output('perl -v', shell=True)
>         self.assert_('This is perl 5' in output)
> 
> unittest.main()

Sure. Much better to have an error message that makes obvious what failed.


Regards,
Ricardo
