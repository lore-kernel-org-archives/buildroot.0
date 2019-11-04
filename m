From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Nov 2019 14:31:50 -0600
Subject: [Buildroot] [PATCH] package/rsyslog: bump to 8.1910.0
In-Reply-To: <87lft02hy8.fsf@dell.be.48ers.dk>
References: <20191030131328.26117-1-matthew.weber@rockwellcollins.com>
 <87lft02hy8.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpZtCp_tCWasTXRmw0nrcyERbLRviwk=j+yYOK4dnKeuOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,


On Fri, Nov 1, 2019 at 7:59 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > The rsyslog project removed the ability to toggle libcurl dependencies in
>  > https://github.com/rsyslog/rsyslog/commit/dc95ef09bdb07cfb7b7df4ce87df629fc2c94f8f,
>  > however there are a series of options that now add a libcurl dependency.
>
>  > This bump disables the following options to prevent libcurl as a new dependency.
>  >      --disable-elasticsearch
>  >         --disable-clickhouse
>  >         --disable-omhttp
>  >         --disable-fmhttp
>  >         --disable-imdocker
>  >         --disable-omhttpfs
>  >         --disable-mmkubernetes
>
> Is that the only dependency they have? Do they add a lot of size? Do
> they need TLS support in libcurl? If not, we might consider enabling
> them when libcurl is enabled.
>

I have sent a patch which conditionally enables these when libcurl is
enabled.  We'll have to see what the autobuilders catch for other
dependencies.  The pkg seems to build Ok with just adding the libcurl
dependency with TLS support disabled.

http://patchwork.ozlabs.org/patch/1189163/

Matt
