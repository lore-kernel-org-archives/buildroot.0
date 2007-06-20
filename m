From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Wed, 20 Jun 2007 11:59:43 +0200
Subject: [Buildroot] Hide troublesome environment variables from sub
	processes [Re: svn commit: trunk/buildroot]
In-Reply-To: <20070620091049.GB21092@aon.at> (Bernhard Fischer's message of
	"Wed, 20 Jun 2007 11:10:50 +0200")
References: <20070619151928.B270A485C2@busybox.net>
	<20070620091049.GB21092@aon.at>
Message-ID: <87vedj3q0g.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "BF" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

>> Log:
>> Hide troublesome environment variables from sub processes
>> (E.G. screws up gdb, busybox, ..)

BF> You should check for these in dependencies.sh instead.

But you cannot clear the environment from within the subshell
executing dependencies.sh - You can ofcause complain loudly, but doing
it in the Makefile makes the system just work (tm) which seems
preferable to me.

-- 
Bye, Peter Korsgaard
