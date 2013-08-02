From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Aug 2013 11:27:42 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130802111026.4ebc403f@skate>
References: <20130731191415.545f7dff@skate>
 <CAHXCMMJ63sJ=m5V1c5+TqOn8TfdBop20gzDHjL85Ks1rYYU+-g@mail.gmail.com>
 <20130801182311.6bb6e57e@skate>
 <CAHXCMMJacpBKoSpKH8NRtDyto92ZZ6AA2bh2jFyOZx4L00cxFw@mail.gmail.com>
 <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
 <20130802105007.6957b0da@skate>
 <CAAXf6LUogmYufmPM9xDf4VjiNV_N_Vg+kuXvzL2ky7Pp0dcJHw@mail.gmail.com>
 <20130802111026.4ebc403f@skate>
Message-ID: <CAAXf6LXgg0jnTAnVu3mRU7ti+6n8LERcONWB=NpHOtvKUG38mA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 2, 2013 at 11:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 2 Aug 2013 11:09:11 +0200, Thomas De Schampheleire wrote:
>
>> > So the intention is really to have 'make foo-rebuild' do that 'make &&
>> > make install' for the user, for the package <foo>.
>>
>> As said, I don't have a problem with the existing
>> reconfigure-does-it-all approach.
>> I may have misunderstood the objections of others: there is no
>> objection against reconfigure doing also rebuild, only that
>> reconfigure and rebuild also make the rootfs?
>
> That's my understanding of what the objections are, yes.

Ok, in this case I'm fine with changing the situation to handle the
objections, so that if you want to make the rootfs, you explicitly
have to call the 'all' target.

This 'translation table' to mimic the old behavior is still correct, right:
foo-reconfigure --> foo-reconfigure all
foo-rebuild     --> foo-rebuild all

Best regards,
Thomas
