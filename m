From: Dominic Newton <dominic.newton@in-2-technology.co.uk>
Date: Wed, 10 Aug 2011 22:48:27 +0100
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E42D99C.7080806@fosstel.com>
References: <4E42D99C.7080806@fosstel.com>
Message-ID: <4E42FCAB.2070609@in-2-technology.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

What version of gcc are you using and what is your target? I have python 
fully functional on x86 and arm platforms with latest buildroot and use 
all 3 modules you are having problems with.

One thing that can help is the setup.py file in the python build 
directory manages the build of the compiled modules like _socket, and 
the output from this file may give a clue on any missing dependencies or 
include files.

Regards

Dominic Newton
In 2 Technology Ltd.

On 10/08/2011 20:18, Pedro Sanchez wrote:
> Hello,
>
> I'm testing Python 2.7.1 as available in current BR and I find that I
> can't load several standard modules that otherwise seem to be present.
>
> # python
> Python 2.7.1 (r271:86832, Aug 4 2011, 16:19:27)
> [GCC 4.5.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>  >>> import socket
> Traceback (most recent call last):
> File "<stdin>", line 1, in <module>
> File "/usr/lib/python2.7/socket.py", line 47, in <module>
> ImportError: No module named _socket
>
>  >>> import fcntl
> Traceback (most recent call last):
> File "<stdin>", line 1, in <module>
> ImportError: No module named fcntl
>
>  >>> from subprocess import Popen, PIPE
> Traceback (most recent call last):
> File "<stdin>", line 1, in <module>
> File "/usr/lib/python2.7/subprocess.py", line 428, in <module>
> ImportError: No module named select
>
>
> Any ideas what's going on? This is on BR from git.
>
