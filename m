From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Dec 2017 11:36:45 -0600
Subject: [Buildroot] [RFC 0/2] Handle conflicting files with Busybox
In-Reply-To: <CANQCQpYmpCKopmh_5yYV74kOyezJSCLxp6T1mUiqnocHLZV92A@mail.gmail.com>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171228170017.GE3428@scaer> <20171228180412.34c81ce2@windsurf.home>
 <20171228172030.GF3428@scaer>
 <CANQCQpZ-qO6v+K4kdqmAEdk2+Dk1Yca1fBqyNwfAjau=50cY7A@mail.gmail.com>
 <CANQCQpYmpCKopmh_5yYV74kOyezJSCLxp6T1mUiqnocHLZV92A@mail.gmail.com>
Message-ID: <CANQCQpZ9ndTBXbhSKtTuG8u_x63rn4hmeiK4vrqeoHU7TUETOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All

On Dec 28, 2017 11:20 AM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

Thomas, All,

[Snip]


I prefer they be explicitly disabled as you did.

First, because this is a security issue that there is dead code: these
applets are still usable by calling 'busybox foo' for example, and that
is a security issue.

Second, yes it gains a bit of space. But that is not so compelling,
becasue if you already have the big buddies enabled, a few kB lost
inBusybox is not that much of a burden anyway...


When it comes to maintaining a custom BusyBox config (which could now be
dynamically updated), maybe we should output a warning when we detect that
we change a config value so the user can know to update their
customizations.  Unsure if this is best as a altered.configs file or just
printing it out.....

(Pardon the html response, no computer this week)

Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171228/32c0871e/attachment.html>
