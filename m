From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 5 Jan 2015 12:13:23 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
	infrastructure
In-Reply-To: <20150105103116.74bbc777@free-electrons.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
 <20150104222307.009f6e73@free-electrons.com>
 <20150104222038.GD31970@free.fr> <20150105103116.74bbc777@free-electrons.com>
Message-ID: <CAJtjsKb2h9h0EGSMtr8SedeneoVhXdGxU+6C3HzNB8LTQ9CVtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Mon, Jan 5, 2015 at 10:31 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 4 Jan 2015 23:20:38 +0100, Yann E. MORIN wrote:
>> > > +# Define the build and install commands
>> > > +#
>> > > +ifeq ($(4),target)
>> > > +
>> > > +ifeq ($$($(2)_CONFIGURE),YES)
>> >
>> > What is $(2)_CONFIGURE exactly? It is not documented in PATCH 04/17.
>>
>> Some rebar packages use autotools for the configure step, and use rebar
>> for the build step. Worse, some of them even require being autoreconf-ed.
>>
>> This variable, if set to YES, means that this package will use the
>> autotools-package infrastrucutre; otherwise, it will be trated as a
>> generic-package.
>
> Not sure of a better name for this one. Maybe $(2)_USE_AUTOTOOLS,
> defaults to no, can be overridden to YES by the packages having a
> configure script? Do they both autoconf and automake, or just autoconf?
> I guess the latter, so maybe $(2)_USE_AUTOCONF.

They use autoconf only (mostly for the rebar.config.in file). So, I
vote for $(2)_USE_AUTOCONF.

-- 
Johan
()  ascii ribbon campaign - against html e-mail
/\  www.asciiribbon.org   - against proprietary attachments
