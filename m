From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 23 Apr 2017 22:25:29 -0300
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
References: <488de6bd-5014-59b4-100b-8a73e9343cb6@mind.be>
Message-ID: <58fd5409bb33e_6531ebf104465d3@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas P,

On Sun, Apr 23, 2017 at 06:34 PM, Arnout Vandecappelle wrote:

> On 20-04-17 09:17, Thomas Petazzoni wrote:
>> Hello,
>> 
>> On Wed, 19 Apr 2017 14:00:53 -0300, Ricardo Martincoski wrote:
>> 
>>>> On 14-04-17 01:44, Ricardo Martincoski wrote:  
>>>>> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>>>>>    automatic checker for coding style before submitting patches;
>>>>>    It checks for a subset of the recommendation (e.g. file naming is not
>>>>>    checked).  
>>>>
>>>>  For me, option D is great. It can also be added to the checkpackage script.  
>>>
>>> I can look into this integration.
>> 
>> I have nothing against option (D), but I'm wondering what is the
>> relation with the checkpackage script. checkpackage checks packages,
>> written in Kconfig and Make, what is the relation with complying with
>> the Python PEP8 recommendation?
> 
>  Actually, check-package checks files, not packages. It looks at the filename
> and if it is one it recognizes, it runs the appropriate checker on it. So a
> checker that applies to files ending with .py could certainly be added.

It is feasible, probably using the library file-magic because not all Python
scripts in the tree use .py extension.

But maybe it is too much, at least for now. 

Before submitting a patch for a package one can use check-package.
Before submitting a patch for a Python script one can use pycodestyle (pep8).

It's not really needed to have a unified script to check both a package and a
Python script.
They are in different directories and are sent in separate patches anyway.

Regards,
Ricardo
