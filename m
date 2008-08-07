From: Leonardo Giordano <lgiordano@gmail.com>
Date: Thu, 07 Aug 2008 11:30:46 -0300
Subject: [Buildroot] Res: Res:  Python / Lua socket programming
In-Reply-To: <226848.6849.qm@web50403.mail.re2.yahoo.com>
References: <226848.6849.qm@web50403.mail.re2.yahoo.com>
Message-ID: <489B0716.1080102@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tiago,
thanks for your reply.
I did the 'export' and it solved some errors/warnings.
However now it says:

#python
'import site' failed; use -v for traceback
Python 2.4.2 (#3, Aug  7 2008, 09:10:04)
[GCC 4.2.4] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>

Then the "import socket" is still failing.
To install python, I just checked it at "make menuconfig" from buildroot.

Regards,

Tiago Maluta escribi?:
> Maybe:
> # export PYTHONHOME=/usr/lib/python2.4.2 or the respective path.
>
> Did you compile this version of Python by hand or get some packed binaries? 
>
>  --
> Tiago Maluta
>
>
>
> ----- Mensagem original ----
> De: Leonardo Giordano <lgiordano@gmail.com>
> Para: Tiago Maluta <maluta_tiago@yahoo.com.br>
> Cc: buildroot at uclibc.org
> Enviadas: Quinta-feira, 7 de Agosto de 2008 11:15:10
> Assunto: Re: Res: [Buildroot] Python / Lua socket programming
>
> Tiago,
>
> Python is working fine on my host machine. I can do the examples at 
> Python Docs.
> However, when tested on my target machine (using linux built with 
> buildroot), I see this:
>
> #python
> Could not find platform independent libraries <prefix>
> Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> 'import site' failed; use -v for traceback
> Python 2.4.2 (#3, Aug  7 2008, 09:10:04)
> [GCC 4.2.4] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>   
>
> Then I can import some modules, for instance "import math" and works fine.
> However, when I do "import socket":
>
>   
>>>> import socket
>>>>         
> Traceback (most recent call last):
>   File "<stdin>", line 1, in ?
> ImportError: No module named socket
>
> Any comments?
>
> Regards,
>
>
> Tiago Maluta escribi?:
>   
>> Leonardo, 
>>
>> Did you followed the Python Docs? http://www.python.org/doc/current/lib/socket-example.html
>> If you are using an operating system based on GNU/Linux, you could check /usr/lib/python2.5 for socket.py
>> Maybe your python installation is missing some modules, try to load other modules (for example: import string, os). 
>>
>>
>> -
>> Tiago Maluta
>>
>> ----- Mensagem original ----
>> De: Leonardo Giordano <lgiordano@gmail.com>
>> Para: buildroot at uclibc.org
>> Enviadas: Quinta-feira, 7 de Agosto de 2008 9:27:14
>> Assunto: [Buildroot] Python / Lua socket programming
>>
>> Hi, I am trying to have an easy programming (or scripting) language. I 
>> have both Lua and Python compiled with buildroot. However, I don't know 
>> how to enable socket programming. I mean:
>> For python, it should have a socket module but it is not. I do "import 
>> socket" but is says it is not present. Maybe is a path problem?
>> For lua, I should add luasocket library but I don't know how.
>>
>> Any comments?
>>
>> Regards,
>>
>>     
>
>
>       Novos endere?os, o Yahoo! que voc? conhece. Crie um email novo com a sua cara @ymail.com ou @rocketmail.com.
> http://br.new.mail.yahoo.com/addresses
>   
