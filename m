From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 09 Mar 2015 20:44:01 +0100
Subject: [Buildroot] [PATCH] fs/common: build host-xz when xz
	compression is used
In-Reply-To: <87r3syqpjn.fsf@dell.be.48ers.dk>
References: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
 <87r3syqpjn.fsf@dell.be.48ers.dk>
Message-ID: <02D91C4C-A869-470B-A9CC-6C56DDEA03A4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On March 9, 2015 2:16:28 PM CET, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com>
>writes:
>
> > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> When a filesystem image is xz-compressed, the XZ variable is used to
>refer
>> to the xz compression tool, but it is not necessarily available. Add
>a
> > proper dependency to fix that.
>
>Isn't that already handled by support/dependencies/check-host-xzcat.mk?

No, that file handles xzcat, the decompression tool, but in fs/ we use
 compression (xz).
