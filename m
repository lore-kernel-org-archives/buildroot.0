From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 24 Feb 2015 13:09:17 -0500
Subject: [Buildroot] [PATCH v6 02/16] package/pkg-rebar: new
	infrastructure
In-Reply-To: <CAJtjsKaOudkqdAPoxC3=8WRdw33WB4eViAVNBTt=Cn_BAE8Nyg@mail.gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-3-git-send-email-johan.oudinet@gmail.com>
 <20150203102832.51cb4f7d@free-electrons.com>
 <CAJtjsKaOudkqdAPoxC3=8WRdw33WB4eViAVNBTt=Cn_BAE8Nyg@mail.gmail.com>
Message-ID: <CA+-urNQ7Wnd_eK+VDWzLMz6VcbZScY7ywwf3yA0dM1CW=8MNPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On Tue, Feb 24, 2015 at 12:07 PM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> Thomas, All,
>
> Sorry for the long delay before replying to this email. I forgot it in
> my list and went to holidays in the meantime.
>
> On Tue, Feb 3, 2015 at 10:28 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>> +# Directories to store rebar dependencies in.
>>> +#
>>> +# These directories actually only contain symbolic links to Erlang
>>> +# applications in either $(HOST_DIR) or $(STAGING_DIR).  One needs
>>> +# them to avoid rebar complaining about missing dependencies, as this
>>> +# infrastructure tells rebar to NOT download dependencies during
>>> +# the build stage.
>>> +#
>>> +REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
>>> +REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
>>
>> Rather than having those paths, why don't we point directly rebar at
>> $(STAGING_DIR)/usr/lib/erlang/lib/ ? This directory already contains
>> <erlang-app>-<version> directory for each package, and we would only
>> have to create a symlink <erlang-app> --> <erlang-app>-<version>.
>>
>> But maybe it's cleaner to have something completely separate, I don't know.
>>
>
> Indeed, this is to keep $(TARGET_DIR)/usr/lib/erlang/lib directory
> clean from unnecessary symlinks.
> I'm not even sure it won't break some erlang programs if we add
> symlinks there. At least, there is none in my Erlang installation.
> Maybe some Erlang guru can give its opinion on this?

I initially liked the idea of just keeping everything in
/usr/lib/erlang/lib rather than having a rebar/deps directory. My
thinking was that there are other Erlang build tools out there
(rebar3, erlang.mk, mix), so having a deps directory just for rebar
wasn't right. However, I'm the point now where I'm watching how how
things go for me with the new rebar/buildroot integration. The current
rebar integration isn't broken for me, so until I become more
opinionated on this, I wasn't going suggest changing anything. Per
your question, I would be surprised if switching the directory broke
anything.

Frank
