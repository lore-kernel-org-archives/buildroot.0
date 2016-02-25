From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 17:50:33 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
	_defconfig file
In-Reply-To: <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
 (Patrick Doyle's message of "Thu, 25 Feb 2016 11:24:31 -0500")
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
 <20160225161451.GE12073@piout.net>
 <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
Message-ID: <87wppsvina.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Doyle <wpdster@gmail.com> writes:

Hi,

>> Yes, that is how I solved it for OE with Yann's advice:
 >> http://git.openembedded.org/openembedded-core/commit/?id=9b75f6a5786ff7b2e6219d78b38f0032f100c660
 >> 
 >> oldnoconfig is now an alias for olddefconfig but appeared earlier so it
 >> was used to do the right thing with more kernel version.
 >> 
 > So this sounds like a change in buildroot is warranted if we want to
 > change this behavior.  I could submit a patch to buildroot that mimics
 > Alexandre's Yocto patch.  Is that the next step here?

Yes, it sounds like it. It seems like oldnoconfig was added in commit
ef61ca88c511154d6bead23c08f9a021cfdfeb01 (2.6.36), so it should work for
anything more recent than that (and otherwise it falls back to what we
have now).

-- 
Bye, Peter Korsgaard
