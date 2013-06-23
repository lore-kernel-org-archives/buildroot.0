From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 23 Jun 2013 19:45:35 +0200
Subject: [Buildroot] [RFC] post-build scripts: limitations, and proposal
In-Reply-To: <51C72B23.2060105@mind.be>
References: <20130620213628.GA3534@free.fr>
 <CAAXf6LVO6Rz3RXLW++kOOfaHGRvR_4AB8Mi=VS2S-pKhJSm5Lw@mail.gmail.com>
 <51C72B23.2060105@mind.be>
Message-ID: <CAAXf6LU6z5SBPZOEuo05V5xBG5v_7zG7O3rjLZickLmpaAfcJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 23, 2013 at 7:06 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21/06/13 08:17, Thomas De Schampheleire wrote:
>>
>> Instead of passing multiple scripts, you could just pass one wrapper
>> post build script, without options. This wrapper would be different in
>> your different configurations, and would call all relevant scripts in
>> turn.
>
>
>  Or alternatively: a wrapper script that observes $0 and decides which other
> scripts to call based on that. So you'd have
> rpi-fixup-rootfs at yem@tvheadend for the one configuration, and
> rpi-fixup-rootfs at yem@wpa for the other one.
>

But this requires a set of symbolic links matching each different
configuration, right?
