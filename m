From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Sep 2013 12:37:05 +0200
Subject: [Buildroot] [RFC] Unification of package comments on wchar,
 largefile, c++ support, thread, ... support
In-Reply-To: <CAAHaz6E16CcRV1gpvFA3KvPfvf78JjqywVJFZxCgs5YOCAeF2g@mail.gmail.com>
References: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
 <CAAHaz6E16CcRV1gpvFA3KvPfvf78JjqywVJFZxCgs5YOCAeF2g@mail.gmail.com>
Message-ID: <CAAXf6LWyOHWDxPHkwga4mCy3UaCu93XEvAaXBpRz86wrQyPfnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Aug 21, 2013 at 7:28 AM, Alexander Lukichev
<alexander.lukichev@gmail.com> wrote:
> Hi Thomas,
>
> 2013/8/19 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
>>
>> I would like to agree on one common text, and adapt all packages
>> accordingly. The exact wording can be discussed, the main goal is the
>> unification. Here is a proposal:
>>
>> <...>
>>
>> What is your opinion on:
>> a. the concept of this unification
>> b. the wording proposed above
>
>
> I also wondered at the free wording in all the multitude of packages. And
> your proposal is a good try to solve the problem. As Arnout has pointed out,
> it would also be nice to minimize the comment length, so
>   - "needs" looks better than "requires";
>   - "support" might well be dropped;
>   - "thread" might be changed to "THREADS" if "support" is dropped.
>

I wasn't aware that the 70-character limit is pretty hard, since there
is no horizontal scrolling in menuconfig?

Based on the input of Alexander, here is an alternate, shorter, proposal:

foo needs a toolchain w/ feat
foo needs a toolchain w/ featA, featB
foo needs a toolchain w/ featA, featB, featC

where the features would be written as: WCHAR, LARGEFILE, IPV6, RPC,
C++, THREADS.

The base length of ' needs a toolchain w/ ' is 22 characters.
With the worst case combination of all features (I hope I didn't
forget any), it is:
' needs a toolchain w/ WCHAR, LARGEFILE, IPV6, RPC, C++, THREADS'
which is 63 characters. So this leaves 7 characters for the package
name, which is not a lot.
(note: I also found a package sshfs that checks for static library, so
the string even becomes a bit longer).

However, few packages need all of these features, and therefore I
think that most of them will fit into the 70-chars limit. In the
exceptional case that goes beyond 70 characters, we could still split
the comment over 2 lines.
Besides, who uses 80-char terminals nowadays anyway ;-)

My question to the community: do we agree on the wording above (foo
needs a toolchain w/ XXX, YYY)?
If yes, then I will proceed to making the changes.

Thanks for your input,
Thomas
