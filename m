Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2689CCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 12:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 823FB6061C;
	Sun,  4 Oct 2026 12:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6m_bYsliWWUE; Sun,  4 Oct 2026 12:44:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BB6C06060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791117855;
	b=jNQSuAlxkzi3gP0qxoR50JySX1KJxAGSyJ4sbN6GxoyCA74/PGfkYjLwVdK8i+aPtCw+
	 S8ipGOQM+prEzxLZt9LiG0ygKJkeAl1/uk47mGkzguAkxLcYprHHZ1nwdH0duNogp2EN3
	 fuBBJHFdTaiSil1R0tJs7p7Bls6vaUaqRWUxs3IKSZlgEy0HmV5OAezORHRTUyUQsCmrE
	 DfVX8oOWdG7QXuJI6wT9+PbrQGaKMLB3P6le25Z/Jp8Ggsmgnb2SlwG3KcQ2Vi39jXwuj
	 BnEAZuKdHqYlHmVPNGz8GG2H7jE6Vlm+DR4glQQcT75NQlixZV9xhvyqFqUmG1fjlVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791117855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NQqihyLi4xA21KXSKWLRwCLonVzfxp5sTcVkLM2h3tM=;
	b=iK0ZImhgYtyHS8d0zhnU4P495aezqjvj8Hzs2Yqq3LvneTuTgZBljd8C6h46946VYu2w
	 2xgh4htCSMNSH+xluH3g3FmpRsqq9tfL2C12R5pjNH+0P7ilQN1Od/CLrCXysmwb63MCG
	 UvpgxDl8cftwOFNU+WTso331Ixx/UfbbJzNOyBwbAmHcxxJjF3UzTk2k3SnHDA185aktP
	 Fs/aFWKSW130mX2H0h6vuB+3Ww1KBQ28Cz6toUo7cpTZVcCZkoFegSEaYaiiFmweoYRxY
	 g39PPBL5/5u8+23iqsqP8Va8e7y7BxytcbPH4HBN8ZB1h7F76pJjlLjdkQ/rCt8AnBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791117855;
	bh=NQqihyLi4xA21KXSKWLRwCLonVzfxp5sTcVkLM2h3tM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QuXxFNyf1OhUApoaRLkOwNE6HfbAgCb5LD7IhyUkTCNN96eCZ48MtJm/VZn2SgdUY
	 7Kr45VsV/gjL+G9yN93rOOJGpJhHMvs5F+uuV9fTiCNq/rRtrOOWA4YYioKBx53sh9
	 nz4sbI5ZXRUrKKo0vXPrTgxsoHbHQB2z0YagLAUfZJmFwz64BmMIpXRmMk83bYNVQu
	 PrlGhAsLSudhgJC4pniBuF+gwEKJ4J6oWavSTQtNM0YeiL+4/zccppsleYUkKm1ezT
	 9P1WBewwsgpzow3ZLOWsMbM6+lAc3+SoiyZol+BfE/PWhcS4tbv8Hqlc9C74w/kkrK
	 JHwfvVFGuTrfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6C06060E;
	Sun,  4 Oct 2026 12:44:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8838232F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A0044007E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fb9XcRdGp4dt for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 12:44:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 86D3B40049
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791117852;
 b=a9TOhUXJfB66xJcuztvt/XncuJWFSGyGTKHTzleB0CyKAXrv7LlhTP+g9zvqTPSTW8T/
 OexuZmQu4y0lF9a9Odi9j5avxro9S2HXZvktoH2enhxpDWQCS9TKqb1Gn5b1EePUforWl
 eaFZ1L5z73fOQlno+K5Ilo/cYKABMY+9vrgeYPTZ46ElE8mKC3X83bqkB9FfxfbjDLcaw
 5HnTQJdskZ2GQQR2RkRLLF5u6upT9r4oaxhyyjFp6mKi7JtITWgygFyBwvC2Cujy7pyxy
 p5bHVv5+DM5TmXgVUbaeeEGAedzjsp7SnOTzP6iwYeQSd3s6svxRO4pj9k38lSnIw3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791117852;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OBFk6trIk9jS3TEV80EHXTfr+fjBHWv5Xnj9oN6E7cU=;
 b=nBSwLNCETKnopY10vatpTJyPT2VWOe84wtMFHCBQQHiyPo/7vjEdiU/NnTOjLp/iplsc
 MGB3nPsf+4RwXUiUjRQuyQomXUT7RYPojOuAI0SGg6FtmxG1lCwuEviU7BOfvKpfDb69O
 g4GZ0rer583em95nprzE6uTIPLPOHLanLa4ooWLr4cZwemMpUfBxLtsStA/rMpV8eoiOH
 g7VEjwr+B+hAkTau0iG0R2Afi5qFQdjUCHhKSSuzcKMse9muR0jeuucdWgT4NFN2mMwZk
 UCmFFg8wkK9PdfcLE6aJH4XhYpCesNhPRMihqMuRghMQhkpUbCFfu3xr5xC3wEwjrdQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qdbAXw2R; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qdbAXw2R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86D3B40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791117848;
 bh=OBFk6trIk9jS3TEV80EHXTfr+fjBHWv5Xnj9oN6E7cU=;
 h=From:To:Cc:Subject:Date:From;
 b=qdbAXw2RRalXoL+51BzRcXi4dTWKHqvlbjtaEqXjA4DJOVQbSkxtgFfVXAh6Y2vU7
 glHVaLJDmx+gXx9cn8zTgkfIFgbDbrFHJyXDYsAwBt5Hx7Ko5noFBx1YFhzhf9B8fd
 YBDrS/sguzVDMYm6BJ5Z7hMkTr0EFOiGUrOrgzKnmrqnjiSCDgJjp53C08HT+T1yyq
 Yi1Ktt9A+PxjjNDqZnNXJHrwOhc3uKCScGycWZ82DOXV15V2D3r7VX7NnX3HNRR0lk
 P6IiRfe9p99XmWUNwoO2rg5K3oy9+1T9df8Aycu4Kv7r4/UeaJLY0SVoXUmLsa1TaQ
 KGz9AEmcYybnw==
X-KAS-Sym: v3:f51bdf72230551df:gZBMEJZZxZQxh3Mn384LQmaAeAqD2CtsxS++4TKyIofKq
 /s84LheW8NglstBqPusEHuU8qns75xSoewvkQLJbVpaPfaly7DeenxBGvd+Fpnl6JWePR/XKj5c
 AqszskvZ+3VUxqEEpR7CDBfhuc45J1/CXVKft47Az5qbAZA1hUa40VkYupsFXrJsNP7sUR6L/1j
 A2Z7G792gbPiVbGsuiKr5+najLlqsv6TE0CI3pr3KyvLL2Q/f4467jhOQ3tAo5u+2PbjU2/i3o3
 +amkkb+U7yRM9tzMKp+wH5glSeocOCqtolTnWG2NuhiFhejHvF7WJ1DoNQ+rJHYJDCZugaEA==:
 GvdRd3Uhe4snJexgr7bne5sRrKMrGPX2ikLHpX4uATnax4hMf56WayQswgrLdMzMMVRyJ6d21sD
 7+INymRrDiFyr8xId/atiMmEdU/muKAF7xRrZYAELNyapFP7aA979F3bmMOi8OeAzJh4XbchMXf
 c9zD+v40cALIgwUQggfNwLORjcVeE4payjO6SpZ14nh4GclvEDz49rIX59BqNGvtJrju2dnXIyB
 1fZAFA1rlMv9DOSMU7XkbtUgQwv/AWMdlQ5n7t+cGLeMRWe0pEdgZfW3EiOgv0ieTT8HTQn3ex3
 y0NaARJUjSbg8MUDXQICdvh0J5PYZwsEZJLkPngMfTNjVIdwGZ5yKda8wjv9uYepul2ql9CV8cm
 q9q3w1AG0VH/o73cGC1GYAXMFkiSjrizsxiUmZEiBFB8CgdOO8hm1GR6vgBumTFF220G+d+/pGt
 r1l1x09tUlxxEbRwYaRQRk3p8myiea/PLpbSD/ThC9mZAxWmCVGmgNXZixaWu+MmIyy2TdIcb3S
 GUpH4TbfzEZW9Z2L2YD+8CvsoKVVvxIDdI3XAHzVMCU8HeQa+1MmR5TOLdJkRUrp7Iu0CZSIbuh
 Og5obR2wnKZo0Em+TdsqrhN9tfL9c4wVqkBdyr/eFgvToqCM/g3L/BrTij5n4yM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E96BBA4C52BA;
 Sun,  4 Oct 2026 14:44:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41726)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDLZX-000000002nK-3ERi;
 Sun, 04 Oct 2026 12:44:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:44:07 +0200
Message-ID: <20261004124407.3597326-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: fix build with
 python-3.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please note that the upstream repo is private so we used the Debian
mirror as source for patch 0003 which is marked as a cherry-pick by
upstream.

Other mirrors are not updated: https://github.com/baoboa/pyqt5/issues/76

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0003-Support-for-Python-v3.15.patch       | 185 ++++++++++++++++++
 ...4-configure.py-remove-Py_LIMITED_API.patch |  37 ++++
 2 files changed, 222 insertions(+)
 create mode 100644 package/python-pyqt5/0003-Support-for-Python-v3.15.patch
 create mode 100644 package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch

diff --git a/package/python-pyqt5/0003-Support-for-Python-v3.15.patch b/package/python-pyqt5/0003-Support-for-Python-v3.15.patch
new file mode 100644
index 0000000000..ec39817b6d
--- /dev/null
+++ b/package/python-pyqt5/0003-Support-for-Python-v3.15.patch
@@ -0,0 +1,185 @@
+From: Phil Thompson <phil@riverbankcomputing.com>
+Date: Mon, 13 Jul 2026 16:38:52 +0100
+Subject: Support for Python v3.15
+
+The project can now be built with Python v3.15 (where the limited ABI
+version targeted will be v3.13).
+
+(cherry picked from commit 3aa6092c44cd17a3afcd9f8ca879c4e40d2662d1)
+
+Upstream: https://salsa.debian.org/python-team/packages/pyqt5/-/blob/1c7499d1d4d79737ae367ec263a9be71ce2b76ee/debian/patches/Support-for-Python-v3.15.patch
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ project.py                             |  8 +++++++
+ qpy/QtCore/qpycore_pyqtproperty.cpp    |  2 +-
+ qpy/QtCore/qpycore_pyqtslot.cpp        | 44 ++++++++++++++++++++++++++--------
+ qpy/QtCore/qpycore_qobject_helpers.cpp | 11 +++++----
+ 4 files changed, 49 insertions(+), 16 deletions(-)
+
+diff --git a/project.py b/project.py
+index 9a3721f..f2143ac 100644
+--- a/project.py
++++ b/project.py
+@@ -111,6 +111,14 @@ del find_qt
+ 
+         return dunder_init
+ 
++    def get_limited_abi_version(self):
++        """ Return the version number of the limited ABI to use. """
++
++        # We use PyWeakref_GetObject() which was removed from the limited API
++        # in Python v3.15.  It's replacement, PyWeakref_GetRef() was added to
++        # the limited ABI in Python v3.13.
++        return (3, 13, 0) if sys.hexversion >= 0x030f0000 else None
++
+     def get_options(self):
+         """ Return the sequence of configurable options. """
+ 
+diff --git a/qpy/QtCore/qpycore_pyqtproperty.cpp b/qpy/QtCore/qpycore_pyqtproperty.cpp
+index d173d51..0245134 100644
+--- a/qpy/QtCore/qpycore_pyqtproperty.cpp
++++ b/qpy/QtCore/qpycore_pyqtproperty.cpp
+@@ -575,7 +575,7 @@ static PyObject *pyqtProperty_reset(PyObject *self, PyObject *reset)
+ static qpycore_pyqtProperty *clone(qpycore_pyqtProperty *orig)
+ {
+     qpycore_pyqtProperty *pp = (qpycore_pyqtProperty *)PyType_GenericNew(
+-            Py_TYPE(orig), 0, 0);
++            Py_TYPE((PyObject *)orig), 0, 0);
+ 
+     if (pp)
+     {
+diff --git a/qpy/QtCore/qpycore_pyqtslot.cpp b/qpy/QtCore/qpycore_pyqtslot.cpp
+index 26f4022..22a7d0c 100644
+--- a/qpy/QtCore/qpycore_pyqtslot.cpp
++++ b/qpy/QtCore/qpycore_pyqtslot.cpp
+@@ -101,7 +101,9 @@ PyQtSlot::Result PyQtSlot::invoke(void **qargs, PyObject *self, void *result,
+     else
+     {
+         // Use the value we have if one wasn't supplied.
+-        if (!self)
++        if (self)
++            Py_INCREF(self);
++        else
+             self = instance();
+ 
+         // If self is NULL then we didn't have a method in the first place.
+@@ -112,12 +114,18 @@ PyQtSlot::Result PyQtSlot::invoke(void **qargs, PyObject *self, void *result,
+ 
+         // See if the instance has gone (which isn't an error).
+         if (self == Py_None)
++        {
++            Py_DECREF(self);
+             return PyQtSlot::Ignored;
++        }
+ 
+         // If the receiver wraps a C++ object then ignore the call if it no
+         // longer exists.
+         if (!no_receiver_check && PyObject_TypeCheck(self, sipSimpleWrapper_Type) && !sipGetAddress((sipSimpleWrapper *)self))
++        {
++            Py_DECREF(self);
+             return PyQtSlot::Ignored;
++        }
+ 
+         sipMethodDef callable_m;
+ 
+@@ -128,6 +136,7 @@ PyQtSlot::Result PyQtSlot::invoke(void **qargs, PyObject *self, void *result,
+ #endif
+ 
+         callable = sipFromMethod(&callable_m);
++        Py_DECREF(self);
+     }
+ 
+     // Convert the C++ arguments to Python objects.
+@@ -188,12 +197,11 @@ bool PyQtSlot::operator==(PyObject *callable) const
+         if (other)
+             return false;
+ 
+-        return (mfunc == callable_m.pm_function
+-                && instance() == callable_m.pm_self
+-#if PY_MAJOR_VERSION < 3
+-                && mclass == callable_m.pm_class
+-#endif
+-                );
++        PyObject *instance_obj = instance();
++        bool res = (mfunc == callable_m.pm_function && instance_obj == callable_m.pm_self);
++        Py_XDECREF(instance_obj);
++
++        return res;
+     }
+ 
+     if (!other)
+@@ -214,14 +222,30 @@ bool PyQtSlot::operator==(PyObject *callable) const
+ }
+ 
+ 
+-// Get the instance object.
++// Get a strong reference to the instance object, otherwise return NULL or a
++// strong reference to Py_None.
+ PyObject *PyQtSlot::instance() const
+ {
++    PyObject *instance_obj;
++
+     // Use the weak reference if possible.
+     if (mself_wr)
+-        return PyWeakref_GetObject(mself_wr);
++    {
++#if PY_VERSION_HEX >= 0x030f0000
++        if (PyWeakref_GetRef(mself_wr, &instance_obj) < 0)
++            instance_obj = NULL;
++#else
++        instance_obj = PyWeakref_GetObject(mself_wr);
++        Py_XINCREF(instance_obj);
++#endif
++    }
++    else
++    {
++        instance_obj = mself;
++        Py_XINCREF(instance_obj);
++    }
+ 
+-    return mself;
++    return instance_obj;
+ }
+ 
+ 
+diff --git a/qpy/QtCore/qpycore_qobject_helpers.cpp b/qpy/QtCore/qpycore_qobject_helpers.cpp
+index f72105c..7b756ec 100644
+--- a/qpy/QtCore/qpycore_qobject_helpers.cpp
++++ b/qpy/QtCore/qpycore_qobject_helpers.cpp
+@@ -50,7 +50,7 @@ static int qt_metacall_worker(sipSimpleWrapper *pySelf, PyTypeObject *pytype,
+ const QMetaObject *qpycore_qobject_metaobject(sipSimpleWrapper *pySelf,
+         sipTypeDef *base)
+ {
+-    sipWrapperType *wt = (pySelf ? (sipWrapperType *)Py_TYPE(pySelf) : 0);
++    sipWrapperType *wt = (pySelf ? (sipWrapperType *)Py_TYPE((PyObject *)pySelf) : 0);
+ 
+     return qpycore_get_qmetaobject(wt, base);
+ }
+@@ -64,7 +64,8 @@ int qpycore_qobject_qt_metacall(sipSimpleWrapper *pySelf, sipTypeDef *base,
+     if (!pySelf)
+         return -1;
+ 
+-    return qt_metacall_worker(pySelf, Py_TYPE(pySelf), base, _c, _id, _a);
++    return qt_metacall_worker(pySelf, Py_TYPE((PyObject *)pySelf), base, _c,
++            _id, _a);
+ }
+ 
+ 
+@@ -236,13 +237,13 @@ bool qpycore_qobject_qt_metacast(sipSimpleWrapper *pySelf,
+ 
+     // We only need to look at the MRO if the object is a wrapped type (rather
+     // than a user sub-class).
+-    if (base_pytype != Py_TYPE(pySelf))
++    if (base_pytype != Py_TYPE((PyObject *)pySelf))
+     {
+         PyObject *mro;
+ 
+ #if PY_VERSION_HEX >= 0x03040000
+-        mro = PyObject_GetAttr((PyObject *)Py_TYPE(pySelf),
+-                qpycore_dunder_mro);
++        mro = PyObject_GetAttr(
++                (PyObject *)Py_TYPE((PyObject *)pySelf), qpycore_dunder_mro);
+         Q_ASSERT(mro);
+ #else
+         mro = Py_TYPE(pySelf)->tp_mro;
diff --git a/package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch b/package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch
new file mode 100644
index 0000000000..f3af7b7fa5
--- /dev/null
+++ b/package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch
@@ -0,0 +1,37 @@
+From 2fbf73d6678e956a6240a6518371ea4bde158bb6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 4 Oct 2026 14:34:24 +0200
+Subject: [PATCH] configure.py: remove Py_LIMITED_API
+
+PyWeakref_GetRef is needed since python 3.15 and used by patch 0003 to
+fix build errors, but PyWeakref_GetRef is only available when
+Py_LIMITED_API+0 >= 0x030D0000:
+https://github.com/python/cpython/blob/v3.15.0rc3/Include/weakrefobject.h#L32
+
+To fix the build error we remove the define set by configure.py.
+
+Upstream: not applicable, file was removed upstream:
+https://salsa.debian.org/python-team/packages/pyqt5/-/blob/debian/5.15.11+dfsg-7/ChangeLog#L33
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index a3450ca3..14e4e925 100644
+--- a/configure.py
++++ b/configure.py
+@@ -2673,9 +2673,6 @@ target.files = $$PY_MODULE
+ 
+     if metadata.qpy_lib:
+         # This is the easiest way to make sure it is set for handwritten code.
+-        if not target_config.py_debug:
+-            pro_lines.append('DEFINES += Py_LIMITED_API=0x03040000')
+-
+         pro_lines.append('INCLUDEPATH += %s' %
+                 qmake_quote(os.path.relpath(source_path('qpy', mname), mname)))
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
