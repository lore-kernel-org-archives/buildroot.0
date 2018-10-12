From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Oct 2018 09:05:46 +0200
Subject: [Buildroot] [PATCH 1/1] utils/get-developers: fix syntax error
In-Reply-To: <20181011230050.28593-1-greg@quimbo.fr> (=?utf-8?Q?=22Gr?=
 =?utf-8?Q?=C3=A9goire?= Delattre"'s
 message of "Fri, 12 Oct 2018 01:00:50 +0200")
References: <20181011230050.28593-1-greg@quimbo.fr>
Message-ID: <87sh1bzlth.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gr?goire" == Gr?goire Delattre <greg@quimbo.fr> writes:

 > From: Gr?goire Delattre <gregoire.delattre@gmail.com>
 > This fixes a syntax error introduced in bcf2ed5cc3.

 > Output before the patch:
 >     $ ./utils/get-developers outgoing/*
 >         File "./utils/get-developers", line 97
 >             print dev
 >                     ^
 >         SyntaxError: Missing parentheses in call to 'print'. Did you mean
 >         print(dev)?

 > Output after the patch:
 >     $ ./utils/get-developers outgoing/*
 >     git send-email --to buildroot at buildroot.org

Ahh, indeed - We need print(foo) instead of print foo for python 3.x
compatibility.

Committed with the commit message extended to explain that this is for
python 3.x, thanks.

-- 
Bye, Peter Korsgaard
