From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 20:41:29 +0100
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <20130121185143.7b62db61@skate> (Thomas Petazzoni's message of
 "Mon, 21 Jan 2013 18:51:43 +0100")
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
 <20130119000053.3f7eebc1@skate>
 <CAG6aBkX8i42SpZAeQ2oPBZOMdT+V125Nadr_OFMoVzNJCda+9Q@mail.gmail.com>
 <20130121181139.09c586ce@skate>
 <CAG6aBkXiBagJnL+CC-7CoVdrN+-rzf-89KpwZraPtt0XNWc4sg@mail.gmail.com>
 <20130121185143.7b62db61@skate>
Message-ID: <87k3r69vdi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Nigel Sollars,
 Thomas> On Mon, 21 Jan 2013 12:26:41 -0500, Nigel Sollars wrote:

 >> Oh I see what your saying, basically the rule is dont use an older
 >> config.  I am guess that manually changing the config to the new
 >> location in this instance, would be good enough for now..

 Thomas> No, the rule is more "we should not break existing configurations". But
 Thomas> sometimes we do, unfortunately. And in many cases, I am the one
 Thomas> responsible for those changes that create incompatibility with existing
 Thomas> configurations.

 Thomas> Arnout recently added a "legacy" mechanism that should, in the
 Thomas> future, help in making such changes less painful.

Indeed. It's not perfect, but we do try. I can also recommend to use the
'make savedefconfig' feature to create a minimalistic defconfig file
rather than the full explicit .config, as you will then automatically
pick up the new defaults for stuff you haven't changed anyway.

-- 
Bye, Peter Korsgaard
