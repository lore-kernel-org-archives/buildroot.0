From: Christian Stewart <christian@paral.in>
Date: Thu, 15 Nov 2018 19:22:05 -0800
Subject: [Buildroot] [PATCH v8 1/1] docker-engine: split docker-{cli,
 engine}, bump to v18.06.1-ce
In-Reply-To: <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
References: <20181108032458.1028-1-christian@paral.in>
 <CANQCQpa0SGdEHVFxn_wmKnktat18iAJ2YLXYQd+4Uqzq5GzG4A@mail.gmail.com>
 <874lcki4rw.fsf@paral.in>
 <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
Message-ID: <871s7liu5e.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

Matthew Weber <matthew.weber@rockwellcollins.com> writes:
> I did find that the dockercli just hangs when I call it, however I
> check and the daemon is running.  I'll see if I can get more debug
> (strace, etc).

The CLI itself is fine, but the daemon sometimes hangs on startup. I
have noticed this problem on my laptop as well (x86) so it's not
specific to this build or environment, it seems.

The daemon will be called, but will not log anything, and basically hang
for sometimes minutes. I try restarting it a few times, but that doesn't
seem to work. If I wait, it usually starts up eventually.

Most of the time the daemon starts immediately, but something seems to
trigger this hang.

Once the daemon is running and logging messages, the CLI is responsive.

It will probably require a strace to figure out why Docker is hanging on
startup like this.

>> Some alternatives:
>>
>>  - http://cri-o.io/ - container runtime interface, will add to BR
>>  - runc - can be used independently of Docker
>>  - docker-containerd - separate daemon for managing container basics
>>  - rkt - coreos container manager
>>  - libpod/podman: https://github.com/containers/libpod
>>
>> I hope to add at least cri-o, rkt, and podman support to Buildroot in
>> the near future.
>
> Are any of those OCI compliant and not written in GO? :-)

I haven't seen a OCI compliant runtime that is not Go, yet.

Best,
Christian
