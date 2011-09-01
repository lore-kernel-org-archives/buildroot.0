From: Pedro Sanchez <psanchez@fosstel.com>
Date: Thu, 01 Sep 2011 10:18:11 -0400
Subject: [Buildroot] Python standard library problems
In-Reply-To: <20110901095040.75c91843@skate>
References: <4E42D99C.7080806@fosstel.com>	<4E42FCAB.2070609@in-2-technology.co.uk>	<4E43D5B4.2090106@fosstel.com>	<4E43F72C.4060005@in-2-technology.co.uk>	<4E441E25.4010600@fosstel.com>	<4E444173.3090509@fosstel.com>	<4E44FA0A.1000902@free-electrons.com>	<4E454A63.6030401@free-electrons.com>	<4E45673C.4010903@fosstel.com>	<4E4A28C1.1070509@free-electrons.com>	<4E5BB725.9030408@free-electrons.com>	<4E5CF562.6070800@fosstel.com>	<4E5E4273.7070201@fosstel.com>
 <20110901095040.75c91843@skate>
Message-ID: <4E5F9423.40000@fosstel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/01/2011 03:50 AM, Thomas Petazzoni wrote:
> Le Wed, 31 Aug 2011 10:17:23 -0400,
> Pedro Sanchez<psanchez@fosstel.com>  a ?crit :
>
>> Tested loading the Python modules of my application. Only one module
>> fails to load now.
>>
>> $ python
>> Python 2.7.1 (r271:86832, Aug 31 2011, 09:38:18)
>> [GCC 4.5.2] on linux2
>> Type "help", "copyright", "credits" or "license" for more information.
>>
>>   >>>  import fcntl
>>   >>>  import os
>>   >>>  import sys
>>   >>>  import signal
>>   >>>  import socket
>>   >>>  import time
>>   >>>  import datetime
>>   >>>  from collections import deque
>>   >>>  from subprocess import Popen, PIPE
>> Traceback (most recent call last):
>>     File "<stdin>", line 1, in<module>
>>     File "/usr/lib/python2.7/subprocess.py", line 432, in<module>
>>     File "/usr/lib/python2.7/pickle.py", line 1266, in<module>
>> ImportError: No module named binascii
>
> Strange, I've built Python for ARM with the latest git, and importing
> subprocess just works fine.
>
> Could you post the complete build log somewhere (not to the list but on
> some pastebin site) :
>
> make clean
> make 2>&1 | tee logfile
>
> and then post logfile.
>
> Thomas

Hi,

The log says:

Failed to build these modules:
binascii           readline

And when building binascii it says:

Include/pyport.h:849:2: error: #error "LONG_BIT definition appears wrong 
for platform (bad gcc/glibc config?)."


The fact that also readline fails to build explains why I can't use the 
cursor keys when using the Python interpreter on my ARM board.

The full log is here (copy and paste to a local file):

http://pastebin.me/746c47fed3b257dbced48473b01ab27c


-- 
Pedro
