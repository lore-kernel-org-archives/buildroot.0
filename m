From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 09:06:43 +0100
Subject: [Buildroot] Non-interactive config
In-Reply-To: <CAK7rcp_PHVOz1_+m_PO=1YaV7c67P3d1Ydpi98Kpxd90WJNRgA@mail.gmail.com>
 (Kenneth Adam Miller's message of "Mon, 9 Jan 2017 01:10:40 -0500")
References: <CAK7rcp_GM4qUjZKWQBHFg3v0=ARj-hPCnJjyi5aaxJNe-3ojpw@mail.gmail.com>
 <CAK7rcp99F5XyyJOpPGXzbUoosOAor6b6ie8gFuJ_rBdcbNZpAg@mail.gmail.com>
 <CAK7rcp_rDYNVqKvVeg--hBqpOV0-6pxrNsi3DxgSEsmKG0+ESA@mail.gmail.com>
 <CAK7rcp8A7NcPoLhv52MzTM01sXXVK2bFnSdEk8OT2Q0XgHpiBA@mail.gmail.com>
 <CAK7rcp-JX0X4hcatGW4XTiqj2oh1RBMq1tJphZa5L2ot=jBPWQ@mail.gmail.com>
 <CAK7rcp-XTJ1z=46Hv0qLQDK0XwY0jJY+TMiTJWWkmNes6rUQRw@mail.gmail.com>
 <CAK7rcp_PHVOz1_+m_PO=1YaV7c67P3d1Ydpi98Kpxd90WJNRgA@mail.gmail.com>
Message-ID: <87y3ykpsh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kenneth" == Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

 > Hello,
 > I need the ability to configure a system non interactively so that I can
 > script the enabling and disabling of various packages automatically. It is
 > not suitable to manually edit and then save the changes, since there are
 > too many combinations of our private packages that must be enabled and
 > disabled.

 > I need this in order to script the generation of many bzImage with
 > different packages of startup commands to test our software in different
 > modes. Right now, I think this can be done if I could so something along
 > the lines of:

The buildroot .config is just a simple text file, so you can process it
with all the normal text handling commands. It shouldn't be that hard to
do some with sed/grep/echo. Have a look at our KCONFIG_*_OPT macros in
package/pkg-utils.mk

-- 
Bye, Peter Korsgaard
