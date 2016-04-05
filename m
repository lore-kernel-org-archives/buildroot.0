From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 09:40:26 +0200
Subject: [Buildroot] [PATCH 1/1] PyMySQL: new package
In-Reply-To: <CAJJ6jxtm+3x_r3D=QeF9t_9EF0NRHDPPvzJrh9sdGcDRaWnovw@mail.gmail.com>
References: <1459197439-25518-1-git-send-email-stevecalfee@gmail.com>
 <5702D9FD.1000908@mind.be>
 <CAJJ6jxtm+3x_r3D=QeF9t_9EF0NRHDPPvzJrh9sdGcDRaWnovw@mail.gmail.com>
Message-ID: <57036BEA.2020907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/04/16 23:41, Steve Calfee wrote:
> Hi, Arnout, thanks for your time, see below.
>
> On Mon, Apr 4, 2016 at 2:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 03/28/16 22:37, Steve Calfee wrote:
[snip]
>>> diff --git a/package/python-pymysql/Config.in
>>> b/package/python-pymysql/Config.in
>>> new file mode 100644
>>> index 0000000..a6de53d
>>> --- /dev/null
>>> +++ b/package/python-pymysql/Config.in
>>> @@ -0,0 +1,7 @@
>>> +config BR2_PACKAGE_PYTHON_PYMYSQL
>>> +       bool "python-pymysql"
>>> +       depends on BR2_PACKAGE_PYTHON
>>
>>
>>   Why? According to the website it supports python3 >= 3.3.
>
> What should I use, or in other words, what is the depends on for
> either python 2 or python 3? I use and have tested it in python 2.7...

  Nothing at all. package/Config.in already expresses the dependency on python 
|| python3. Look at any other python package, you'll only see a dependency on 
python or python3 if it doesn't work on the other one.

  Ideally you should also (build) test it with python3, but if you don't, the 
autobuilders will.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
