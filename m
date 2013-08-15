From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Aug 2013 08:04:30 -0300
Subject: [Buildroot] [PATCH] libsecret: New package
In-Reply-To: <CAG2jQ8hEpcA0CbsSjG9R1pLDdGJGy_gytGqXAvGWJuLqn6+SMw@mail.gmail.com>
References: <1376562685-17191-1-git-send-email-markos.chandras@imgtec.com>
 <520CB048.6060707@zacarias.com.ar>
 <CAG2jQ8hEpcA0CbsSjG9R1pLDdGJGy_gytGqXAvGWJuLqn6+SMw@mail.gmail.com>
Message-ID: <520CB5BE.7070608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/15/2013 07:56 AM, Markos Chandras wrote:
> Hi Gustavo,
> 
> Thanks for the review.
> 
> Would it be better to replace 'select' with 'depend' to avoid
> implicitly enabling these toolchain components?

Hi.
For libglib2 and other hard dependencies we usually just depend on the
toolchain components being available and select libglib2 like you did
with a nice comment when the toolchain isn't up to the requirements
saying so...

comment "libsecret requires a toolchain with X and Y support".
depends on !BR2_TOOLCHAIN_HAS_X || !BR2_TOOLCHAIN_HAS_Y
(with the appropiate labels of course!)

Only when there's a real choice (say, two different libglib2
implementations) a depend would be appropiate (xorg is a good example
since there's a choice between full and kdrive/tinyx, and it usually
requires extra configuration - drivers).

Enabling toolchain components is bad, if it did and you add a package as
a later thought after building your basic system you mess things up.

Regards.
