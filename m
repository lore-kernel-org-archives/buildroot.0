From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:35:57 +0100
Subject: [Buildroot] [PATCH 1/3] eudev: fix error handling init script
In-Reply-To: <20180130040720.20172-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Tue, 30 Jan 2018 02:07:18 -0200")
References: <20180130040720.20172-1-casantos@datacom.ind.br>
Message-ID: <87tvv25hoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Replace (echo "msg" && exit 1) by { echo "msg"; exit 1; }.
 > The (list) compound command runs in a subshell, so the "exit" interrupts
 > the subshell, not the main script. Examples:

 >     $ sh -c "echo 1; (exit 1); echo 2"
 >     1
 >     2
 >     $ sh -c "echo 1; { exit 1; }; echo 2"
 >     1
 >     $

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed to 2017.02.x and 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
